#' Calculates the hypermodularity index (hyperQ)
#'
#' Calculates the hypermodularity index proposed in Pinheiro et al. 2026 for a
#' tripartite network.
#'
#' Analogous to the bipartite modularity index (Q), the hypermodularity index
#' (hyperQ) measures the cohesion of tripartite hypermodules, increasing with
#' module congruence and with the proportion of interactions that occur within,
#' rather than between, hypermodules.
#'
#' @param x A trinet object.
#' @param mod_corresp A matrix describing the correspondence between modules in
#'  bipartite networks (A-B) and (B-C). Rows represent BN (A-B) modules,
#'  columns represent BN (B-C) modules, and positive values identify
#'  hypermodules.
#'
#' @return A named numeric vector containing three measures:
#'  * `hyper_q`: overall hypermodularity for the tripartite network (A-B-C).
#'  * `hyper_q_ab`: component of hypermodularity for BN (A-B).
#'  * `hyper_q_bc`: component of hypermodularity for BN (B-C).
#'
#' @references Pinheiro RBP, Peralta G, Lewinsohn TM, Cagnolo L. 2026 The hypermodular structure of tripartite ecological networks. Proc. R. Soc. B 293 : 20261348. [https://doi.org/10.1098/rspb.2026.1348](https://doi.org/10.1098/rspb.2026.1348)
#'
#' @export
hyper_q <- function(x,
                    mod_corresp
) {
  if (!inherits(x, "trinet")) {
    stop("This is no trinet object! ",
         "Please use the function make_trinet to create one.",
         call. = FALSE)
  }

  mod_ab_labels <- unique(x$connector$ab)
  mod_bc_labels <- unique(x$connector$bc)

  if (!setequal(mod_ab_labels, rownames(mod_corresp)) ||
      !setequal(mod_bc_labels, colnames(mod_corresp))) {
    stop("Each module that includes at least one connector species must ",
         "correspond to exactly one positive hypermodule label in mod_corresp.",
         call. = FALSE)
  }

  keep_a <- x$mod_ab$cols %in% mod_ab_labels
  keep_c <- x$mod_bc$cols %in% mod_bc_labels

  bn_ab <- x$bn_ab[names(x$connector$ab), keep_a, drop = FALSE]
  bn_bc <- x$bn_bc[names(x$connector$bc), keep_c, drop = FALSE]

  # hypermodules
  hmod_a <- mod2hmod(mod = x$mod_ab$cols[keep_a],
                     mod_corresp = mod_corresp)

  hmod_b_ab <- mod2hmod(mod = x$connector$ab,
                        mod_corresp = mod_corresp)

  hmod_b_bc <- mod2hmod(mod = x$connector$bc,
                        side = "col",
                        mod_corresp = mod_corresp)

  hmod_c <- mod2hmod(mod = x$mod_bc$cols[keep_c],
                     side = "col",
                     mod_corresp = mod_corresp)

  # hypermodularity BN (A-B)
  hq_ab <- .calculate_hyper_q(bn_ab, hmod_b_bc, hmod_a)

  # hypermodularity BN (B-C)
  hq_bc <- .calculate_hyper_q(bn_bc, hmod_b_ab, hmod_c)

  # overall hipermodularity (hyperQ)
  hq <- mean(c(hq_ab, hq_bc))

  c(hyper_q = hq,
    hyper_q_ab = hq_ab,
    hyper_q_bc = hq_bc)
}


#' Helper function to calculate hypermodularity
#' @noRd
.calculate_hyper_q <- function(net, hmod_rows, hmod_cols) {
  # relative weights
  relative <- net / sum(net)

  expected <- outer(rowSums(relative), colSums(relative))
  within <- outer(hmod_rows, hmod_cols, "==")

  sum((relative - expected)[within])
}
