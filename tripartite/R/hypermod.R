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
.connect_empty_row <- function(corresp
) {
  empty_rows <- rowSums(corresp) == 0

  if(!any(empty_rows)) {
    return(corresp)
  }

  empty_cols <- colSums(corresp) == 0

  rn <- which(empty_rows)[sample.int(length(which(empty_rows)), 1)]
  cn <- sample.int(ncol(corresp), 1)

  n_empty_rows <- sum(empty_rows)

  merge_prob <- (nrow(corresp) / (nrow(corresp) + ncol(corresp))) ^ (1 / n_empty_rows)

  create_new <- (stats::runif(1) < (1 - merge_prob)) | empty_cols[cn]

  if (create_new) {
    corresp[, cn] <- 0
    corresp[rn, cn] <- setdiff(seq_len(max(nrow(corresp), ncol(corresp)) + 1), corresp)[1]

  }
  else {
    # hmod_cols <- apply(mat, 2, max)
    hmod_cols <- (colSums(corresp) / colSums(corresp > 0))
    corresp[rn, hmod_cols == hmod_cols[cn]] <- hmod_cols[cn]
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
    # treat rows
    corresp <- .connect_empty_row(corresp)

    # treat columns by reusing the logic for rows (transpose in, transpose
    # back, so the orientation (AB modules in rows) is always preserved)
    corresp <- t(.connect_empty_row(t(corresp)))
  }

  corresp
}


#' Optimize hypermodular structure via simulated annealing
#'
#' *INSERT DESCRIPTION!!!*
#'
#' @param x A tripartite object.
#' @param lambda Numeric scalar between 0 and 1 giving the cooling rate applied
#'  to the temperature at each iteration. Defaults to `0.9995`.
#' @param temp0 Numeric scalar corresponding to the initial temperature.
#'  Defaults to `4`.
#' @param max_steps Integer determining the maximum number of iterations to the
#'  simulated annealing. Defaults to `50000`.
#' @param steps_stop Integer determining the maximum number of consecutive
#'  iterations without strict improvement in the target metric.
#'  Defaults to `5000`.
#'
#' @return A named list containing:
#'  * `metrics`: a matrix that keeps track of all correspondence values
#'    until the algorithm ends.
#'  * `mod_corresp`: the final module correspondence matrix.
#'
#' @export
hypermod <- function(x = NULL,
                     lambda = 0.9995,
                     temp0 = 4,
                     max_steps = 50000,
                     steps_stop = 5000#, metric = "adjusted congruence"
) {
  if (!inherits(x, "tripartite")) {
    stop("This is no tripartite object! Please use the
         function make_tripartite to create one.",
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

  metrics <- matrix(NA_real_,
                    nrow = max_steps,
                    ncol = 3,
                    dimnames = list(NULL, c("baseline", "realized", "adjusted")))
  metrics[1, ] <- current_congruence[c("baseline", "realized", "adjusted")]

  best_corresp <- current_corresp
  best_adjusted <- metrics[1, "adjusted"] # TODO: implement for other metrics

  # setting parameters for the HyperMod algorithm (simulated annealing)
  temperature <- temp0
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
    tmp_adjusted <- tmp_congruence[["adjusted"]]

    # determining either acceptance or rejection
    change <- tmp_adjusted - metrics[iteration - 1, "adjusted"]

    if (change > 0) {
      last_change <- iteration
    }

    accept <- if (change >= 0) {
      TRUE
    }
    else {
      prob <- min(1, exp(change / temperature))
      stats::runif(1) < prob

      # try this other step
      #log(stats::runif(1)) < exp(change / temperature)
    }

    if (accept) {
      current_corresp <- tmp_corresp
      current_congruence <- tmp_congruence
      metrics[iteration, ] <- current_congruence[c("baseline", "realized", "adjusted")]

      # sets best metric
      if (tmp_adjusted > best_adjusted) {
        best_adjusted <- tmp_adjusted
        best_corresp <- current_corresp
      }
    }
    else {
      metrics[iteration, ] <- metrics[iteration - 1, ]
    }

    temperature <- temperature * lambda
    iteration <- iteration + 1

    #if (printR&iteration%%printR_each == 0) {
    #  print(iteration)
    #}

    stop_search <- (iteration - last_change) >= steps_stop
  }

  # trim unused pre-allocated rows if stopped before it hit max_steps
  metrics <- metrics[seq_len(iteration - 1), , drop = FALSE]

  list(
    metrics = metrics,
    mod_corresp = current_corresp
  )
}
