#' Constructs an object of type "trinet"
#'
#' Combines two Bipartite Networks (A-B) and (B-C) matrices with their
#' respective modules into a standardized `"trinet"` S3 object.
#'
#' *DESCRIPTION*
#'
#' For mod_ab and mod_bc fragment just like hyper_q code (e.g. mod_ab:
#'  mod_ab_a, mod_ab_b)
#'
#' @param bn_ab A matrix (binary or weighted) representing the bipartite network
#'  (A-B).
#'  The connector node set (node set B) must be represented by the rows.
#' @param bn_bc A matrix (binary or weighted) representing the bipartite network
#'  (B-C).
#'  The connector node set (node set B) must be represented by the rows.
#' @param mod_ab_a A vector of module labels for the species on the node set A
#'  of bipartite network A-B.
#'  Values of modules that include at least one connector species must match
#'  the row names of `mod_corresp`.
#'
#' @param mod_ab_b A vector of module labels for the species on the node set B
#'  (connector node set) of bipartite network A-B.
#'  Values of modules that include at least one connector species must match
#'  the row names of `mod_corresp`.
#'
#' @param mod_bc_b A vector of module labels for the species on the node set B
#'  (connector node set) of bipartite network B-C.
#'  Values of modules that include at least one connector species must match
#'  the column names of `mod_corresp`.
#'
#' @param mod_bc_c A vector of module labels for the species on the node set C
#'  of bipartite network B-C.
#'  Values of modules that include at least one connector species must match
#'  the column names of `mod_corresp`.
#'
#' @return A trinet object, which is a named list containing:
#'  * `bn_ab`: The input interaction matrix for network (A-B).
#'  * `bn_bc`: The input interaction matrix for network (B-C).
#'  * `mod_ab`: A list with components `rows` and `cols` holding standardized,
#'     named module labels (prefixed with `"MOD_AB_"`) for `bn_ab`.
#'  * `mod_bc`: A list with components `rows` and `cols` holding standardized,
#'     named module labels (prefixed with `"MOD_BC_"`) for `bn_bc`.
#'  * `connector`: A list with components `ab` and `bc` containing the module
#'     labels of the shared connector species.
#'
#' @export
make_trinet <- function(bn_ab,
                        bn_bc,
                        mod_ab_a,
                        mod_ab_b,
                        mod_bc_b,
                        mod_bc_c
) {
  .validate_network(bn_ab, net_name = "bn_ab")
  .validate_network(bn_bc, net_name = "bn_bc")

  mod_ab <- list(
    rows = .standardize_labels(mod_ab_b,
                               rownames(bn_ab),
                               "MOD_AB_"),
    cols = .standardize_labels(mod_ab_a,
                               colnames(bn_ab),
                               "MOD_AB_"))

  mod_bc <- list(
    rows = .standardize_labels(mod_bc_b,
                               rownames(bn_bc),
                               "MOD_BC_"),
    cols = .standardize_labels(mod_bc_c,
                               colnames(bn_bc),
                               "MOD_BC_"))

  consp <- intersect(rownames(bn_ab), rownames(bn_bc))

  if (length(consp) == 0) {
    stop("There is no connector species.",
         call. = FALSE)
  }
  else if (length(consp) <= 5) {
    warning(sprintf("There is too few (<=5) connector species: %s.",
                    length(consp)),
            call. = FALSE)
  }

  connector <- list(
    ab = mod_ab$rows[consp],
    bc = mod_bc$rows[consp])


  # Report relevant information
  message("------ Report ------\n",
          "Number of connector species: ", length(connector$ab), ".\n",
          "Size of node set A (A-B): ", length(mod_ab$cols), ".\n",
          "Size of node set B (A-B): ", length(mod_ab$rows), ".\n",
          "Size of node set B (B-C): ", length(mod_bc$rows), ".\n",
          "Size of node set C (B-C): ", length(mod_bc$cols), ".\n")

  out <- list(bn_ab = bn_ab,
              bn_bc = bn_bc,
              mod_ab = mod_ab,
              mod_bc = mod_bc,
              connector = connector)
  class(out) <- "trinet"
  out
}



#' Validate bipartite network matrix and report error messages regarding
#' data quality
#' @noRd
.validate_network <- function(net,
                              net_name = "network"
) {

  if (!is.matrix(net)) {
    net <- as.matrix(net)
  }

  check_invalid_names <- function(nms, margin_label) {
    # no labels in nms
    if (is.null(nms)) {
      return(invisible(NULL))
    }

    # Check for invalid characters by detect names that change under
    # make.names() or contain characters outside alphanumeric or ".", "_" and "-"
    is_invalid <- (nms != make.names(nms)) || grepl("[^A-Za-z0-9_.-]", nms) || grepl("\\..*\\.", nms)
    if (any(is_invalid)) {
      bad_idx <- which(is_invalid)
      details <- paste0(margin_label, " ", bad_idx, " ['", nms[bad_idx], "']",
                        collapse = "; ")

      stop(sprintf("In '%s': Invalid characters detected in %s names: %s.",
                   net_name,
                   tolower(margin_label),
                   details),
           call. = FALSE)
    }
  }

  check_invalid_names(rownames(net), "Row")
  check_invalid_names(colnames(net), "Column")

  # check for NA values
  if (anyNA(net)) {
    na_pos <- which(is.na(net), arr.ind = TRUE)
    row_id <- if (!is.null(rownames(net))) {
      rownames(net)[na_pos[, 1]]
    }
    else {
      na_pos[, 1]
    }
    col_id <- if (!is.null(colnames(net))) {
      colnames(net)[na_pos[, 2]]
    }
    else {
      na_pos[, 2]
    }
    where <- paste0("(", row_id, ", ", col_id, ")", collapse = ", ")

    stop(sprintf("In '%s': %d NA value(s) detected at [row, col]: %s.",
                 net_name,
                 nrow(na_pos),
                 where),
         call. = FALSE)
  }

  # check for empty rows
  empty_rows <- which(rowSums(net, na.rm = TRUE) == 0)
  if (length(empty_rows) > 0) {
    r_names <- if (!is.null(rownames(net))) {
      rownames(net)[empty_rows]
    }
    else {
      empty_rows
    }
    r_details <- paste0(empty_rows, " ('", r_names, "')", collapse = ", ")

    stop(sprintf("In '%s': Empty row(s) with zero total interactions detected at row: %s.",
                 net_name,
                 r_details),
         call. = FALSE)
  }

  # check for empty columns
  empty_cols <- which(colSums(net, na.rm = TRUE) == 0)
  if (length(empty_cols) > 0L) {
    c_names <- if (!is.null(colnames(net))) {
      colnames(net)[empty_cols]
    }
    else {
      empty_cols
    }
    c_details <- paste0(empty_cols, " ('", c_names, "')", collapse = ", ")

    stop(sprintf("In '%s': Empty column(s) with zero total interactions detected at column: %s.",
                 net_name,
                 c_details),
         call. = FALSE)
  }
}



#' Standardize rows and columns labels to guarantee module correspondence
#' @noRd
.standardize_labels <- function(labels,
                                id,
                                prefix
) {
  if (is.null(names(labels))) {
    names(labels) <- id
  }
  else {
    labels <- labels[id]
  }
  stats::setNames(paste0(prefix, labels), names(labels))
}
