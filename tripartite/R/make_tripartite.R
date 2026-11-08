#' Constructs an object of type "tripartite"
#'
#' Combines two Bipartite Networks (A-B) and (B-C) matrices with their
#' respective modules into a standardized `"tripartite"` S3 object.
#'
#' *INSERT DESCRIPTION!*
#'
#' @param bn_ab A matrix (binary or weighted) representing the bipartite network
#'  (A-B).
#'  The connector node set (node set B) must be represented by the rows.
#' @param bn_bc A matrix (binary or weighted) representing the bipartite network
#'  (B-C).
#'  The connector node set (node set B) must be represented by the rows.
#' @param mod_ab A list (the output of `bipartite::DIRT_LPA_wb_plus()`) of
#'  module labels for the species of the bipartite network A-B.
#'  Values must match the row or the col names of `mod_corresp`.
#' @param mod_bc A list (the output of `bipartite::DIRT_LPA_wb_plus()`) of
#'  module labels for the species of the bipartite network B-C.
#'  Values must match the row or the col names of `mod_corresp`.
#'
#' @return A tripartite object, which is a named list containing:
#'  * `bn_ab`: The input interaction matrix for network (A-B).
#'  * `bn_bc`: The input interaction matrix for network (B-C).
#'  * `mod_ab`: A list with components `rows` and `cols` holding standardized,
#'     named module labels (prefixed with `"MOD_AB_"`) for `bn_ab`.
#'  * `mod_bc`: A list with components `rows` and `cols` holding standardized,
#'     named module labels (prefixed with `"MOD_BC_"`) for `bn_bc`.
#'  * `connector`: A list with components `ab` and `bc` containing the module
#'     labels of the shared connector species.
#'
#' @examples
#' bn_ab <- matrix(
#'   c(1, 0, 1, 0, 1, 0),
#'   nrow = 3,
#'   dimnames = list(c("spB1", "spB2", "spB3"), c("spA1", "spA2"))
#' )
#' bn_bc <- matrix(
#'   c(1, 1, 0, 1, 0, 1),
#'   nrow = 3,
#'   dimnames = list(c("spB1", "spB2", "spB3"), c("spC1", "spC2"))
#' )
#' mod_ab <- list(Row_labels = c(1, 2, 1), Col_labels = c(1, 2))
#' mod_bc <- list(Row_labels = c(1, 1, 2), Col_labels = c(1, 2))
#'
#' tri <- make_tripartite(bn_ab, bn_bc, mod_ab, mod_bc)
#' tri$connector
#'
#' @export
make_tripartite <- function(bn_ab,
                            bn_bc,
                            mod_ab,
                            mod_bc
) {
  .validate_network(bn_ab, mod_ab, net_name = "bn_ab")
  .validate_network(bn_bc, mod_bc, net_name = "bn_bc")

  mod_ab <- list(
    rows = .standardize_labels(mod_ab$Row_labels,
                               rownames(bn_ab),
                               "MOD_AB_",
                               "mod_ab rows"),
    cols = .standardize_labels(mod_ab$Col_labels,
                               colnames(bn_ab),
                               "MOD_AB_",
                               "mod_ab cols"))

  mod_bc <- list(
    rows = .standardize_labels(mod_bc$Row_labels,
                               rownames(bn_bc),
                               "MOD_BC_",
                               "mod_bc rows"),
    cols = .standardize_labels(mod_bc$Col_labels,
                               colnames(bn_bc),
                               "MOD_BC_",
                               "mod_bc cols"))

  consp <- intersect(rownames(bn_ab), rownames(bn_bc))
  connector <- list(
    ab = mod_ab$rows[consp],
    bc = mod_bc$rows[consp]
  )

  out <- list(bn_ab = bn_ab,
              bn_bc = bn_bc,
              mod_ab = mod_ab,
              mod_bc = mod_bc,
              connector = connector)
  class(out) <- "tripartite"
  out
}



#' Validate bipartite network matrix and report data quality warnings and
#'  error messages
#' @noRd
.validate_network <- function(net,
                              mod = NULL,
                              net_name = "network"
) {

  if (!is.matrix(net)) {
    net <- as.matrix(net)
  }

  check_invalid_names <- function(nms, mod_labels, margin_label) {
    if (is.null(nms)) {
      return(invisible(NULL))
    }

    # Check for invalid characters by detect names that change under
    # make.names() or contain characters outside alphanumeric or ".", "_" and "-"
    is_invalid <- (nms != make.names(nms)) | grepl("[^A-Za-z0-9_.-]", nms)
    if (any(is_invalid)) {
      bad_idx <- which(is_invalid)
      mod_info <- if (!is.null(mod_labels) && length(mod_labels) >= max(bad_idx)) {
        paste0(" (allocated to module '", mod_labels[bad_idx], "')")
      }
      else {
        ""
      }
      details <- paste0(
        margin_label, " ", bad_idx, " ['", nms[bad_idx], "']", mod_info,
        collapse = "; "
      )

      warning(sprintf("In '%s': Invalid characters detected in %s names: %s.",
                      net_name,
                      tolower(margin_label),
                      details),
              call. = FALSE)
    }
  }

  check_invalid_names(rownames(net), mod$Row_labels, "Row")
  check_invalid_names(colnames(net), mod$Col_labels, "Column")

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
                                prefix,
                                what
) {
  if (is.null(labels)) {
    stop("Missing module labels for ", what, ".",
         call. = FALSE)
  }

  if (is.null(names(labels))) {
    names(labels) <- id # assumed to follow matrix order
  }
  else {
    if (!setequal(names(labels), id)) {
      stop("Species names in ", what, " do not match the matrix.",
           call. = FALSE)
    }
    labels <- labels[id] # align by name
  }

  stats::setNames(paste0(prefix, labels), names(labels))
}
