#' Constructs an object of type "trinet"
#'
#' Combines two Bipartite Networks (A-B) and (B-C) matrices with their
#' respective modules into a standardized `trinet` S3 object
#' to be used by the other functions of the `hypermodular` package.
#'
#' Module labels can be of any type (they are converted to character and
#' prefixed). If a label vector is named, names must match the species names
#' (order is then irrelevant); if it is unnamed, it must have one label per
#' species, in the order of the rows/columns of the corresponding matrix.
#'
#' Module arguments follow the pattern `mod_<network>_<node set>`; for example,
#' `mod_ab_a` holds the module labels of node set A in bipartite network (A-B).
#'
#' @param bn_ab A matrix (binary or weighted) representing the bipartite network
#'  (A-B).
#'  The connector node set (node set B) must be represented by the rows.
#' @param bn_bc A matrix (binary or weighted) representing the bipartite network
#'  (B-C).
#'  The connector node set (node set B) must be represented by the rows.
#' @param mod_ab_a A vector of module labels for the species in the node set A
#'  of bipartite network A-B.
#' @param mod_ab_b A vector of module labels for the species in the node set B
#'  (connector node set) of bipartite network A-B.
#' @param mod_bc_b A vector of module labels for the species in the node set B
#'  (connector node set) of bipartite network B-C.
#' @param mod_bc_c A vector of module labels for the species in the node set C
#'  of bipartite network B-C.
#' @param report A Boolean that determines whether a report of the data will
#'   be shown. Defaults to `TRUE`.
#'
#' @return A `trinet` object, which is a named list containing:
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
                        mod_bc_c,
                        report = TRUE
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

  connector <- list(ab = mod_ab$rows[consp],
                    bc = mod_bc$rows[consp])

  # Report relevant information
  if (report) {
    message("------ Report ------\n",
            "Size of node set A (A-B): ", length(mod_ab$cols), "\n",
            "Size of node set B (A-B): ", length(mod_ab$rows), "\n",
            "Size of node set B (B-C): ", length(mod_bc$rows), "\n",
            "Size of node set C (B-C): ", length(mod_bc$cols), "\n",
            "Number of connector species: ", length(connector$ab), "\n")
  }

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

  if (!is.numeric(net)) {
    stop(sprintf("In '%s': the network must be numeric (binary or weighted).",
                 net_name),
         call. = FALSE)
  }

  check_names <- function(nms, margin_label) {
    # no labels in nms
    if (is.null(nms)) {
      stop(sprintf("In '%s': %s names are required.",
                   net_name,
                   tolower(margin_label)),
           call. = FALSE)
    }

    # Check for invalid characters, which should not contain
    # characters outside alphanumeric or ".", "_", "-" and " ".
    is_bad <- is.na(nms) | !nzchar(nms) | grepl("^\\s|\\s$|[^A-Za-z0-9_. -]", nms) | grepl("\\..*\\.", nms)
    if (any(is_bad)) {
      bad_idx <- which(is_bad)
      details <- paste0(margin_label, " ", bad_idx, " ['", nms[bad_idx], "']",
                        collapse = "; ")

      stop(sprintf("In '%s': Invalid characters detected in %s names: %s.",
                   net_name,
                   tolower(margin_label),
                   details),
           call. = FALSE)
    }

    dup <- unique(nms[duplicated(nms)])
    if (length(dup) > 0) {
      stop(sprintf("In '%s': Duplicated %s names detected: %s.",
                   net_name,
                   tolower(margin_label),
                   paste(dup, collapse = ", ")),
           call. = FALSE)
    }
  }

  check_names(rownames(net), "Row")
  check_names(colnames(net), "Column")

  # check for NA values
  if (anyNA(net)) {
    na_pos <- which(is.na(net), arr.ind = TRUE)

    where <- paste0("(", rownames(net)[na_pos[, 1]],
                    ", ", colnames(net)[na_pos[, 2]], ")",
                    collapse = ", ")

    stop(sprintf("In '%s': %d NA value(s) detected at [row, col]: %s.",
                 net_name,
                 nrow(na_pos),
                 where),
         call. = FALSE)
  }

  # check for negative values
  if (any(net < 0)) {
    stop(sprintf("In %s: values must be non-negative.",
                 net_name),
         call. = FALSE)
  }

  # check for empty rows
  empty_rows <- which(rowSums(net) == 0)
  if (length(empty_rows) > 0) {
    r_details <- paste0(empty_rows, " ('", rownames(net)[empty_rows], "')",
                        collapse = ", ")

    stop(sprintf("In '%s': Empty row(s) with zero total interactions detected at row: %s.",
                 net_name,
                 r_details),
         call. = FALSE)
  }

  # check for empty columns
  empty_cols <- which(colSums(net) == 0)
  if (length(empty_cols) > 0) {
    c_details <- paste0(empty_cols, " ('", colnames(net)[empty_cols], "')",
                        collapse = ", ")

    stop(sprintf("In '%s': Empty column(s) with zero total interactions detected at column: %s.",
                 net_name,
                 c_details),
         call. = FALSE)
  }

  net
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



