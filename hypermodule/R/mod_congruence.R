#' Calculates module congruence metrics
#'
#' Calculates baseline, realized and adjusted congruence between the module
#' labels of Bipartite Networks (A-B) and (B-C) (according to Pinheiro et al.
#' 2026).
#'
#' Baseline congruence is calculated by multiplying the relative sizes of each
#' module across BNs and adding across all modules.
#'
#' Realized congruence is calculated as the proportion of connector species
#' attributed to the same hypermodule in both BNs, i.e., the proportion of
#' matching hypermodule labels.
#'
#' Adjusted congruence is the difference between realized and baseline
#' congruence.
#'
#' @param hmod_ab A vector of hypermodule labels for the connector species of
#'  bipartite network (A-B).
#' @param hmod_bc A vector of hypermodule labels for the connector species of
#'  bipartite network (B-C).
#'
#' @return A named numeric vector containing three measures:
#'  * `baseline`: expected congruence based on marginal proportions
#'    of hypermodule labels.
#'  * `realized`: observed proportion of matching labels.
#'  * `adjusted`: realized congruence minus baseline congruence.
#'
#' @references Pinheiro RBP, Peralta G, Lewinsohn TM, Cagnolo L. 2026 The hypermodular structure of tripartite ecological networks. Proc. R. Soc. B 293 : 20261348.[https://doi.org/10.1098/rspb.2026.1348](https://doi.org/10.1098/rspb.2026.1348)
#'
#' @examples
#' hmod_ab <- c("hmod1", "hmod1", "hmod2", "hmod3", "hmod2", "hmod3")
#' hmod_bc <- c("hmod1", "hmod1", "hmod2", "hmod1", "hmod2", "hmod3")
#'
#' congr <- mod_congruence(hmod_ab, hmod_bc)
#'
#' congr["baseline"]
#'
#' @export
mod_congruence <- function(hmod_ab,
                           hmod_bc
) {
  hmod_ab_labels <- sort(unique(hmod_ab))
  baseline <- sum(
    vapply(
      hmod_ab_labels,
      function(hmod) {
        mean(hmod_ab == hmod) * mean(hmod_bc == hmod)
      },
      numeric(1)
    )
  )

  realized <- mean(hmod_ab == hmod_bc)

  adjusted <- (realized - baseline)

  c(baseline = baseline,
    realized = realized,
    adjusted = adjusted)
}
