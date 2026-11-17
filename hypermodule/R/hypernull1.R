#' Null model 1 for hypermodularity analysis
#'
#' Null model 1: Randomizes connector species among hypermodules independently
#' in each bipartite network, preserving hypermodule sizes. It tests whether
#' observed congruence exceeds random expectations given the existing
#' hypermodular configuration (Pinheiro et al. 2026).
#'
#' @param x A hypermod_results object made by the `hypermod()` function.
#' @param n Number of randomization included in the null model.
#' @param n_cores Number of cores used in parallel computing
#'  (using doSNOW package).
#'
#' @return A named list containing:
#'  * `baseline`: a vector with baseline congruence values for each
#'    randomization.
#'  * `realized`: a vector with realized congruence values for each
#'    randomization.
#'  * `adjusted`: a vector with adjusted congruence values for each
#'    randomization.
#'
#' @references Pinheiro RBP, Peralta G, Lewinsohn TM, Cagnolo L. 2026 The hypermodular structure of tripartite ecological networks. Proc. R. Soc. B 293 : 20261348.[https://doi.org/10.1098/rspb.2026.1348](https://doi.org/10.1098/rspb.2026.1348)
#'
#' @export
hypernull1 <- function(x,
                       n = 1000,
                       n_cores = 1
) {
  if (!inherits(x, "hypermod_results")) {
    stop("This is no hypermod_results object! ",
         "Please use the function hypermod to create one.",
         call. = FALSE)
  }

  hmod_ab <- mod2hmod(mod = x$trinet$connector$ab,
                      mod_corresp = x$mod_corresp)
  hmod_bc <- mod2hmod(mod = x$trinet$connector$bc,
                      mod_corresp = x$mod_corresp,
                      side = "col")

  `%dopar%` <- foreach::`%dopar%`

  cl <- parallel::makeCluster(n_cores)
  doSNOW::registerDoSNOW(cl)
  null_congruence <- foreach::foreach(j = seq_len(n),
                                      .verbose = FALSE,
                                      .packages = "hypermodule"
  ) %dopar% {
    # congruence in randomized hypermodules
    mod_congruence(hmod_ab = sample(hmod_ab),
                   hmod_bc = sample(hmod_bc))
  }
  parallel::stopCluster(cl)
  rm(cl)

  baseline <- sapply(null_congruence, function(v) {v[["baseline"]]})
  realized <- sapply(null_congruence, function(v) {v[["realized"]]})
  adjusted <- sapply(null_congruence, function(v) {v[["adjusted"]]})

  message("------ Congruence Null1 ------ \n",
          "Realized mean: ", round(mean(realized), 3),"\n",
          "Realized 95%: ", round(stats::quantile(realized, 0.95), 3),"\n",
          "Adjusted mean: ", round(mean(adjusted), 3),"\n",
          "Adjusted 95%: ", round(stats::quantile(adjusted, 0.95), 3),"\n",
          "------------------ \n",
          "p-value for adjusted congruence: ", mean(x$final[3] < adjusted), "\n")

  list(baseline = baseline,
       realized = realized,
       adjusted = adjusted)

}
