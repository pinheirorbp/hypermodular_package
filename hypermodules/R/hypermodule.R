#' Optimize hypermodular structure via simulated annealing
#'
#' *INSERT DESCRIPTION!!!*
#'
#' @param x A trinet object.
#' @param lambda Numeric scalar between 0 and 1 giving the cooling rate applied
#'  to the temperature at each iteration. Defaults to `0.9995`.
#' @param temp Numeric scalar corresponding to the initial temperature.
#'  Defaults to `4`.
#' @param max_steps Integer determining the maximum number of iterations to the
#'  simulated annealing. Defaults to `50000`.
#' @param steps_stop Integer determining the maximum number of consecutive
#'  iterations without strict improvement in the target metric.
#'  Defaults to `5000`.
#' @param metric String value corresponding to the optimized metric. Values can
#'  be 'adjusted' or 'hypermodularity'.
#'  Defaults to `adjusted`.
#'
#' @return A named list containing:
#'  * `final`: final congruence values for baseline, realized and adjusted
#'  * `metrics`: a matrix that keeps track of all correspondence values
#'    until the algorithm ends.
#'  * `mod_corresp`: the final module correspondence matrix.
#'
#' @export
hypermodule <- function(x = NULL,
                     lambda = 0.9995,
                     temp = 4,
                     max_steps = 50000,
                     steps_stop = 5000,
                     metric = "adjusted"
) {
  if (!inherits(x, "trinet")) {
    stop("This is no trinet object! Please use the
         function make_trinet to create one.",
         call. = FALSE
    )
  }

  # initializes module correspondence matrix
  current_corresp <- .init_mod_corresp(x)

  # congruence of the initial module correspondences
  hmod_ab <- mod2hmod(mod = x$connector$ab,
                      mod_corresp = current_corresp)
  hmod_bc <- mod2hmod(mod = x$connector$bc,
                      side = "col",
                      mod_corresp = current_corresp)
  current_congruence <- unlist(mod_congruence(hmod_ab = hmod_ab,
                                              hmod_bc = hmod_bc))

  # add 'hypermodularity' column for further optimization
  metrics <- matrix(NA_real_,
                    nrow = max_steps,
                    ncol = 3,
                    dimnames = list(NULL, c("baseline", "realized", "adjusted")))
  metrics[1, ] <- current_congruence[c("baseline", "realized", "adjusted")]

  # setting parameters for the HyperMod algorithm (simulated annealing)
  temperature <- temp
  iteration <- 2
  last_change <- 2
  stop_search <- FALSE

  while (iteration <= max_steps && !stop_search) {
    # candidate for best correspondence
    tmp_corresp <- .disturb_corresp(current_corresp)

    # congruence of the new module correspondences
    hmod_ab <- mod2hmod(mod = x$connector$ab,
                        mod_corresp = tmp_corresp)

    hmod_bc <- mod2hmod(mod = x$connector$bc,
                        side = "col",
                        mod_corresp = tmp_corresp)

    tmp_congruence <- unlist(mod_congruence(hmod_ab = hmod_ab,
                                            hmod_bc = hmod_bc))

    # metric to be optimized
    tmp_score <- tmp_congruence[[metric]]

    # determining either acceptance or rejection
    change <- tmp_score - metrics[iteration - 1, metric]

    if (change > 0) {
      last_change <- iteration
    }

    accept <- if (change >= 0) {
      TRUE
    } else {
      prob <- min(1, exp(change / temperature))
      stats::runif(1) < prob
    }

    if (accept) {
      current_corresp <- tmp_corresp
      current_congruence <- tmp_congruence
      metrics[iteration, ] <- current_congruence[c("baseline", "realized", "adjusted")]

    }
    else {
      metrics[iteration, ] <- metrics[iteration - 1, ]
    }

    temperature <- temperature * lambda
    stop_search <- (iteration - last_change) >= steps_stop
    iteration <- iteration + 1
  }

  # trim unused pre-allocated rows if stopped before it hit max_steps
  metrics <- metrics[seq_len(iteration - 1), , drop = FALSE]

  message("Final congruence: \n", metrics[nrow(metrics), ], "\n")

  list(
    final = metrics[nrow(metrics), ],
    metrics = metrics,
    mod_corresp = current_corresp
  )
}



#' @noRd
.init_mod_corresp <- function(x
) {
  mod_ab <- unique(x$connector$ab)
  mod_bc <- unique(x$connector$bc)

  n_ab <- length(mod_ab)
  n_bc <- length(mod_bc)

  mod_corresp <- matrix(0,
                        nrow = n_ab,
                        ncol = n_bc,
                        dimnames = list(mod_ab, mod_bc)
  )
  if (n_ab > n_bc) {
    for (i in seq_len(n_ab)) {
      j <- (i - 1) %% n_bc + 1
      mod_corresp[i, j] <- j
    }
  } else {
    for (i in seq_len(n_bc)) {
      j <- (i - 1) %% n_ab + 1
      mod_corresp[j, i] <- j
    }
  }

  mod_corresp
}



#' @noRd
.connect_empty_row <- function(corresp,
                               empty_rows,
                               empty_cols
) {
  rn <- which(empty_rows)[sample.int(length(which(empty_rows)), 1)]
  cn <- sample.int(ncol(corresp), 1)

  n_empty_rows <- sum(empty_rows)

  merge_prob <- (nrow(corresp) / (nrow(corresp) + ncol(corresp))) ^ (1 / n_empty_rows)

  create_new <- (stats::runif(1) < (1 - merge_prob)) || empty_cols[cn]

  if (create_new) {
    corresp[, cn] <- 0
    corresp[rn, cn] <- setdiff(seq_len(max(nrow(corresp), ncol(corresp))), corresp)[1]
  }
  else {
    # vector for in which hypermodule each column is
    hmod_col <- (colSums(corresp) / colSums(corresp > 0))
    corresp[rn, hmod_col == hmod_col[cn]] <- hmod_col[cn]
  }

  corresp
}



#' @noRd
.disturb_corresp <- function(corresp
) {
  # uniform probability to disconnect a row or a column
  if (stats::runif(1) < 0.5) {
    corresp[sample.int(nrow(corresp), 1), ] <- 0
  }
  else {
    corresp[, sample.int(ncol(corresp), 1)] <- 0
  }

  # run until no row or column is disconnected
  while (any(c(colSums(corresp) == 0, rowSums(corresp) == 0))) {
    empty_rows <- rowSums(corresp) == 0
    empty_cols <- colSums(corresp) == 0

    # treat rows
    if (any(empty_rows)) {
      corresp <- .connect_empty_row(corresp, empty_rows, empty_cols)
    }

    # treat columns by reusing the logic for rows (transpose in, transpose
    # back, so the orientation (AB modules in rows) is always preserved)
    t_corresp <- t(corresp)
    t_empty_rows <- rowSums(t_corresp) == 0
    t_empty_cols <- colSums(t_corresp) == 0
    if (any(t_empty_rows)) {
      corresp <- t(.connect_empty_row(t_corresp, t_empty_rows, t_empty_cols))
    }
  }

  corresp
}
