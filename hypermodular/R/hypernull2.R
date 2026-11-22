#' Null model 2 for hypermodularity analysis
#'
#' Null model 2: Randomizes connector species among bipartite modules while
#' preserving module sizes, then reruns HyperMod to identify an optimal
#' hypermodular configuration for each randomization. It tests whether observed
#' congruence exceeds that expected from bipartite module sizes (Pinheiro et al.
#' 2026).
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
#' @references Pinheiro RBP, Peralta G, Lewinsohn TM, Cagnolo L. 2026 The hypermodular structure of tripartite ecological networks. Proc. R. Soc. B 293 : 20261348. \doi{10.1098/rspb.2026.1348}
#'
#' @export
hypernull2 <- function(x,
                       n = 100,
                       n_cores = 1
) {
  if (!inherits(x, "hypermod_results")) {
    stop("This is no hypermod_results object! ",
         "Please use the function hypermod to create one.",
         call. = FALSE)
  }

  `%dopar%` <- foreach::`%dopar%`

  cl <- parallel::makeCluster(n_cores)
  doSNOW::registerDoSNOW(cl)
  null_congruence <- foreach::foreach(j = seq_len(n),
                                      .verbose = FALSE,
                                      .packages = "hypermodular"
  ) %dopar% {
    n_trinet <- x$trinet
    n_trinet$connector <- lapply(n_trinet$connector, function(v) {
      stats::setNames(sample(v), names(v))
    })

    n_trinet$mod_ab$rows[names(x$trinet$connector$ab)] <- n_trinet$connector$ab
    n_trinet$mod_bc$rows[names(x$trinet$connector$bc)] <- n_trinet$connector$bc

    # congruence in randomized hypermodules
    hyper_mod <- hypermod(x = n_trinet,
                         lambda = x$parameters$lambda,
                         temp = x$parameters$temp,
                         max_steps = x$parameters$max_steps,
                         steps_stop = x$parameters$steps_stop,
                         report = FALSE)

    list(baseline = hyper_mod$final[[1]],
         realized = hyper_mod$final[[2]],
         adjusted = hyper_mod$final[[3]])
  }
  parallel::stopCluster(cl)
  rm(cl)

  baseline <- sapply(null_congruence, function(v) {v[["baseline"]]})
  realized <- sapply(null_congruence, function(v) {v[["realized"]]})
  adjusted <- sapply(null_congruence, function(v) {v[["adjusted"]]})

  message("------ Congruence Null2 ------ \n",
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
