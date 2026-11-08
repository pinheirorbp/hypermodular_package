#' Calculates the hypermodularity index (hyperQ)
#'
#' Calculates the hypermodularity index proposed in Pinheiro et all. 2026 for a
#' tripartite network
#'
#' Analogous to the bipartite modularity index (Q), the hypermodularity index
#' (hyperQ) measures the cohesion of tripartite hypermodules, increasing with
#' module congruence and with the proportion of interactions that occur within,
#' rather than between, hypermodules.
#'
#' @param bn_ab A matrix (binary or weighted) representing the bipartite
#'  network (A-B).
#'  The connector node set (node set B) must be represented by the rows.
#'
#' @param bn_bc A matrix (binary or weighted) representing the bipartite
#'  network (B-C).
#'  The connector node set (node set B) must be represented by the rows.
#'
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
#' @param mod_corresp A matrix describing the correspondence between modules in
#'  bipartite networks (A-B) and (B-C). Rows represent BN (A-B) modules,
#'  columns represent BN (B-C) modules, and positive values identify
#'  hypermodules.
#'
#' @return A named numeric vector containing three measures:
#'  * `hyper_q`: overall hypermodularity for the tripartite network (A-B-C)
#'  * `hyper_q_ab`: component of hypermodularity for BN (A-B)
#'  * `hyper_q_bc`: component of hypermodularity for BN (B-C)
#'
#' @references Pinheiro RBP, Peralta G, Lewinsohn TM, Cagnolo L. 2026 The hypermodular structure of tripartite ecological networks. Proc. R. Soc. B 293 : 20261348. [https://doi.org/10.1098/rspb.2026.1348](https://doi.org/10.1098/rspb.2026.1348)
#'
#' @export
hyper_q <- function(bn_ab= NULL,
                    bn_bc= NULL,
                    mod_ab_a= NULL,
                    mod_ab_b= NULL,
                    mod_bc_b= NULL,
                    mod_bc_c= NULL,
                    mod_corresp= NULL
) {

  # Filtering
  # In node set B = only connector species
  # In node set A and C = only species within hypermodules

  # connector species
  consp <- rownames(bn_ab)[is.element(rownames(bn_ab), rownames(bn_bc))]
  consp_ab <- match(consp, rownames(bn_ab))
  consp_bc <- match(consp, rownames(bn_bc))

  # modules of connector species
  consp_mod_ab <- mod_ab_b[consp_ab]
  consp_mod_bc <- mod_bc_b[consp_bc]

  mod_ab_labels <- unique(consp_mod_ab)
  mod_bc_labels <- unique(consp_mod_bc)

  if (any(sort(mod_ab_labels) != sort(rownames(mod_corresp))) |
      any(sort(mod_bc_labels) != sort(colnames(mod_corresp)))
  ) {
    stop(
      "ERROR: Each module that includes at least one connector species must",
      "correspond to exactly one positive hypermodule label in mod_corresp.",
      call. = FALSE
    )
  }

  # Applying filter to all node sets ({variable_name}_filtered)
  # only accounted for the species of node sets A and C in modules that were
  # included in a hypermodule, and for the connector species in node set B
  mod_ab_a_filtered <- mod_ab_a[mod_ab_a%in%mod_ab_labels]
  mod_ab_b_filtered <- consp_mod_ab
  mod_bc_b_filtered <- consp_mod_bc
  mod_bc_c_filtered <- mod_bc_c[mod_bc_c%in%mod_bc_labels]

  bn_ab_filtered <- bn_ab[consp_ab, mod_ab_a%in%mod_ab_labels]
  bn_bc_filtered <- bn_bc[consp_bc, mod_bc_c%in%mod_bc_labels]

  # Hypermodules
  hmod_ab_a_filtered <- mod2hmod(mod = mod_ab_a_filtered,
                         side = "row",
                         mod_corresp = mod_corresp
                         )

  hmod_ab_b_filtered <- mod2hmod(mod = mod_ab_b_filtered,
                         side = "row",
                         mod_corresp = mod_corresp
                         )

  hmod_bc_b_filtered <- mod2hmod(mod = mod_bc_b_filtered,
                         side = "col",
                         mod_corresp = mod_corresp
                         )

  hmod_bc_c_filtered <- mod2hmod(mod = mod_bc_c_filtered,
                         side = "col",
                         mod_corresp = mod_corresp
                         )

  # Hypermodularity BN (A-B)
  relative_bn_ab_filtered <- bn_ab_filtered / sum(bn_ab_filtered) # relative weights

  expected_ab <- outer(rowSums(relative_bn_ab_filtered), colSums(relative_bn_ab_filtered))
  intra_hip_ab <- outer(hmod_bc_b_filtered,
                        hmod_ab_a_filtered,
                        "=="
                        )

  hypermodularity_ab <- sum((relative_bn_ab_filtered - expected_ab)[intra_hip_ab])

  # Hypermodularity BN (B-C)
  relative_bn_bc_filtered <-  bn_bc_filtered / sum(bn_bc_filtered) # relative weights

  expected_bc <- outer(rowSums(relative_bn_bc_filtered), colSums(relative_bn_bc_filtered))
  intra_hip_bc <- outer(hmod_ab_b_filtered,
                        hmod_bc_c_filtered,
                        "=="
                        )

  hypermodularity_bc <- sum((relative_bn_bc_filtered - expected_bc)[intra_hip_bc])

  # Overall hipermodularity (hyperQ)
  hypermodularity <- mean(c(hypermodularity_ab, hypermodularity_bc))

  c(
    hyper_q = hypermodularity,
    hyper_q_ab = hypermodularity_ab,
    hyper_q_bc = hypermodularity_bc
    )
}
