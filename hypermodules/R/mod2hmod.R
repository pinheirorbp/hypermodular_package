#' Translates modules to hypermodules
#'
#' Assigns hypermodule labels for species of a node set
#' using a correspondence matrix (modules x hypermodules).
#'
#' @param mod A vector of module labels for species of a node set.
#'  Values must match the row or the col names of `mod_corresp`.
#' @param side Indicates whether modules are represented by rows or columns in
#'  the `mod_corresp`. Values must be "row" or "col".
#' @param mod_corresp A matrix describing the correspondence between modules in
#'  bipartite networks (A-B) and (B-C). Rows represent BN (A-B) modules, columns
#'  represent BN (B-C) modules, and positive values identify hypermodules.
#'
#' @return A numeric vector `hmod`, which corresponds to hypermodule labels for
#'  the species of the given node set,
#'
#' @examples
#' mod_corresp <- matrix(
#'   c(1, 0, 0, 2, 0, 2),
#'   nrow = 3,
#'   byrow = TRUE,
#'   dimnames = list(
#'     c("AB_mod1", "AB_mod2", "AB_mod3"),
#'     c("BC_mod1", "BC_mod2")
#'   )
#' )
#'
#' mod2hmod(
#'   mod = rep(c("AB_mod1", "AB_mod2", "AB_mod3"), each = 3),
#'   side = "row",
#'   mod_corresp = mod_corresp
#' )
#'
#' @export
mod2hmod <- function(mod = NULL,
                     side = "row",
                     mod_corresp = NULL
) {

  if (!side%in%c("col", "row")) {
    stop ("Typo! Side must be row or col",
          call. = FALSE)
  }

  hmod <- numeric(length(mod))

  if (side == "col") {
    mod_corresp <- t(mod_corresp)
  }

  for (row in seq_len(nrow(mod_corresp))) {
    corresp_labels <- unique(mod_corresp[row, ])
    hmod_labels <- corresp_labels[corresp_labels > 0]

    if (length(hmod_labels) != 1) {
      stop("Each module must correspond to exactly one positive ",
           "hypermodule label.",
           call. = FALSE)
    }

    mod_labels <- rownames(mod_corresp)[row]
    hmod[mod == mod_labels] <- hmod_labels
  }

  hmod_labels <- sort(unique(hmod))
  correspondence_labels <- as.numeric(sort(unique(mod_corresp[mod_corresp != 0])))

  if ((!identical(hmod_labels, correspondence_labels)) || (any(hmod == 0))) {
    stop("Inconsistent hypermodule labels across the module vectors ",
         "and correspondence matrix.",
         call. = FALSE)
  }

  hmod
}
