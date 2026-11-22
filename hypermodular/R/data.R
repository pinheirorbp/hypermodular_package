# data.R -- documentation of the tripartite network data sets.
#
# Naming: dataset_NN_ab and dataset_NN_bc are the two bipartite interaction matrices of
# tripartite network NN (NN = "Data set" number in FINAL_DATABASE.xlsx). For a network
# named "A-B-C", _ab holds the A-B interactions and _bc the B-C interactions.
# "stacked"/"non-stacked" is the network configuration recorded in FINAL_DATABASE.xlsx.
# Site names, partitions and configurations come from FINAL_DATABASE.xlsx; full
# bibliographic references come from the original-sources list.
# Note: Rd/roxygen text below is UTF-8; DESCRIPTION should declare "Encoding: UTF-8".

#' Dataset 01, AB partition: Plant–Seed disperser interactions (Azores)
#'
#' Interaction matrix between the Plant (layer A) and Seed disperser (layer B) partitions of the
#' tripartite network "Plant–Seed disperser–Parasite" (data set 1 of the database; site/system: Azores;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_01_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 287.
#'
#' @seealso \code{\link{dataset_01_bc}}
#'
#' @source
#' Heleno, R. H., J. A. Ramos, and J. Memmott. 2013. Integration of exotic seeds into an Azorean seed dispersal network. \emph{Biological Invasions} 15:1143–1154.
"dataset_01_ab"

#' Dataset 01, BC partition: Seed disperser–Parasite interactions (Azores)
#'
#' Interaction matrix between the Seed disperser (layer B) and Parasite (layer C) partitions of the
#' tripartite network "Plant–Seed disperser–Parasite" (data set 1 of the database; site/system: Azores;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_01_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 117.
#'
#' @seealso \code{\link{dataset_01_ab}}
#'
#' @source
#' Heleno, R. H., J. A. Ramos, and J. Memmott. 2013. Integration of exotic seeds into an Azorean seed dispersal network. \emph{Biological Invasions} 15:1143–1154.
"dataset_01_bc"

#' Dataset 02, AB partition: Herbivore–Plant interactions (Azores)
#'
#' Interaction matrix between the Herbivore (layer A) and Plant (layer B) partitions of the
#' tripartite network "Herbivore–Plant–Seed disperser" (data set 2 of the database; site/system: Azores;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_02_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 1116.
#'
#' @seealso \code{\link{dataset_02_bc}}
#'
#' @source
#' Heleno, R., I. Lacerda, J. A. Ramos, and J. Memmott. 2010. Evaluation of restoration effectiveness: Community response to the removal of alien plants. \emph{Ecological Applications} 20:1191–1203.
"dataset_02_ab"

#' Dataset 02, BC partition: Plant–Seed disperser interactions (Azores)
#'
#' Interaction matrix between the Plant (layer B) and Seed disperser (layer C) partitions of the
#' tripartite network "Herbivore–Plant–Seed disperser" (data set 2 of the database; site/system: Azores;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_02_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 287.
#'
#' @seealso \code{\link{dataset_02_ab}}
#'
#' @source
#' Heleno, R., I. Lacerda, J. A. Ramos, and J. Memmott. 2010. Evaluation of restoration effectiveness: Community response to the removal of alien plants. \emph{Ecological Applications} 20:1191–1203.
"dataset_02_bc"

#' Dataset 03, AB partition: Plant–Herbivore interactions (Azores)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 3 of the database; site/system: Azores;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_03_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 1116.
#'
#' @seealso \code{\link{dataset_03_bc}}
#'
#' @source
#' Heleno, R. H., R. S. Ceia, J. A. Ramos, and J. Memmott. 2009. Effects of alien plants on insect abundance and biomass: A food-web approach. \emph{Conservation Biology} 23:410–419.
"dataset_03_ab"

#' Dataset 03, BC partition: Herbivore–Parasitoid interactions (Azores)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 3 of the database; site/system: Azores;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_03_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 156.
#'
#' @seealso \code{\link{dataset_03_ab}}
#'
#' @source
#' Heleno, R. H., R. S. Ceia, J. A. Ramos, and J. Memmott. 2009. Effects of alien plants on insect abundance and biomass: A food-web approach. \emph{Conservation Biology} 23:410–419.
"dataset_03_bc"

#' Dataset 04, AB partition: Seed disperser–Plant interactions (Galapagos)
#'
#' Interaction matrix between the Seed disperser (layer A) and Plant (layer B) partitions of the
#' tripartite network "Seed disperser–Plant–Pollinator" (data set 4 of the database; site/system: Galapagos;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_04_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 1764.
#'
#' @seealso \code{\link{dataset_04_bc}}
#'
#' @source
#' Heleno, R., J. M. Olesen, M. Nogales, P. Vargas, and A. Traveset. 2012. Seed dispersal networks in the Galapagos and the consequences of alien plant invasions. \emph{Proceedings of the Royal Society B: Biological Sciences} 280:20122112.
#'
#' Traveset, A., J. M. Olesen, M. Nogales, P. Vargas, P. Jaramillo, E. Antolín, M. M. Trigo, and R. Heleno. 2015. Bird–flower visitation networks in the Galápagos unveil a widespread interaction release. \emph{Nature Communications} 6:6376.
"dataset_04_ab"

#' Dataset 04, BC partition: Plant–Pollinator interactions (Galapagos)
#'
#' Interaction matrix between the Plant (layer B) and Pollinator (layer C) partitions of the
#' tripartite network "Seed disperser–Plant–Pollinator" (data set 4 of the database; site/system: Galapagos;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_04_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 23320.
#'
#' @seealso \code{\link{dataset_04_ab}}
#'
#' @source
#' Heleno, R., J. M. Olesen, M. Nogales, P. Vargas, and A. Traveset. 2012. Seed dispersal networks in the Galapagos and the consequences of alien plant invasions. \emph{Proceedings of the Royal Society B: Biological Sciences} 280:20122112.
#'
#' Traveset, A., J. M. Olesen, M. Nogales, P. Vargas, P. Jaramillo, E. Antolín, M. M. Trigo, and R. Heleno. 2015. Bird–flower visitation networks in the Galápagos unveil a widespread interaction release. \emph{Nature Communications} 6:6376.
"dataset_04_bc"

#' Dataset 05, AB partition: Plant–Herbivore interactions (Dorset)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 5 of the database; site/system: Dorset;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_05_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 275.
#'
#' @seealso \code{\link{dataset_05_bc}}
#'
#' @source
#' Carvalheiro, L. G., Y. M. Buckley, and J. Memmott. 2010. Diet breadth influences how the impact of invasive plants is propagated through food webs. \emph{Ecology} 91:1063–1074.
"dataset_05_ab"

#' Dataset 05, BC partition: Herbivore–Parasitoid interactions (Dorset)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 5 of the database; site/system: Dorset;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_05_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 165.
#'
#' @seealso \code{\link{dataset_05_ab}}
#'
#' @source
#' Carvalheiro, L. G., Y. M. Buckley, and J. Memmott. 2010. Diet breadth influences how the impact of invasive plants is propagated through food webs. \emph{Ecology} 91:1063–1074.
"dataset_05_bc"

#' Dataset 06, AB partition: Plant–Herbivore interactions (Norwood)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 6 of the database; site/system: Norwood;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_06_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 114.
#'
#' @seealso \code{\link{dataset_06_bc}}
#'
#' @source
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2010. The impact of farm management on species-specific leaf area index (LAI): Farm-scale data and predictive models. \emph{Agriculture, Ecosystems and Environment} 135:279–287.
#'
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2012. The robustness and restoration of a network of ecological networks. \emph{Science} 335:973–977.
"dataset_06_ab"

#' Dataset 06, BC partition: Herbivore–Parasitoid interactions (Norwood)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 6 of the database; site/system: Norwood;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_06_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 289.
#'
#' @seealso \code{\link{dataset_06_ab}}
#'
#' @source
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2010. The impact of farm management on species-specific leaf area index (LAI): Farm-scale data and predictive models. \emph{Agriculture, Ecosystems and Environment} 135:279–287.
#'
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2012. The robustness and restoration of a network of ecological networks. \emph{Science} 335:973–977.
"dataset_06_bc"

#' Dataset 07, AB partition: Herbivore–Plant interactions (Norwood)
#'
#' Interaction matrix between the Herbivore (layer A) and Plant (layer B) partitions of the
#' tripartite network "Herbivore–Plant–Pollinator" (data set 7 of the database; site/system: Norwood;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_07_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 840.
#'
#' @seealso \code{\link{dataset_07_bc}}
#'
#' @source
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2012. The robustness and restoration of a network of ecological networks. \emph{Science} 335:973–977.
"dataset_07_ab"

#' Dataset 07, BC partition: Plant–Pollinator interactions (Norwood)
#'
#' Interaction matrix between the Plant (layer B) and Pollinator (layer C) partitions of the
#' tripartite network "Herbivore–Plant–Pollinator" (data set 7 of the database; site/system: Norwood;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_07_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 11327.
#'
#' @seealso \code{\link{dataset_07_ab}}
#'
#' @source
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2012. The robustness and restoration of a network of ecological networks. \emph{Science} 335:973–977.
"dataset_07_bc"

#' Dataset 08, AB partition: Plant–Herbivore interactions (Norwood)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 8 of the database; site/system: Norwood;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_08_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 840.
#'
#' @seealso \code{\link{dataset_08_bc}}
#'
#' @source
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2012. The robustness and restoration of a network of ecological networks. \emph{Science} 335:973–977.
"dataset_08_ab"

#' Dataset 08, BC partition: Herbivore–Parasitoid interactions (Norwood)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 8 of the database; site/system: Norwood;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_08_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 99.
#'
#' @seealso \code{\link{dataset_08_ab}}
#'
#' @source
#' Pocock, M. J. O., D. M. Evans, and J. Memmott. 2012. The robustness and restoration of a network of ecological networks. \emph{Science} 335:973–977.
"dataset_08_bc"

#' Dataset 09, AB partition: Plant–Herbivore interactions (Borneo)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 9 of the database; site/system: Borneo;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_09_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 416.
#'
#' @seealso \code{\link{dataset_09_bc}}
#'
#' @source
#' Blüthgen, N., D. Mezger, and K. E. Linsenmair. 2006. Ant-hemipteran trophobioses in a Bornean rainforest—Diversity, specificity and monopolisation. \emph{Insectes Sociaux} 53:194–203.
"dataset_09_ab"

#' Dataset 09, BC partition: Herbivore–Defender interactions (Borneo)
#'
#' Interaction matrix between the Herbivore (layer B) and Defender (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 9 of the database; site/system: Borneo;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_09_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 559.
#'
#' @seealso \code{\link{dataset_09_ab}}
#'
#' @source
#' Blüthgen, N., D. Mezger, and K. E. Linsenmair. 2006. Ant-hemipteran trophobioses in a Bornean rainforest—Diversity, specificity and monopolisation. \emph{Insectes Sociaux} 53:194–203.
"dataset_09_bc"

#' Dataset 10, AB partition: Plant–Seed disperser interactions (Coimbra)
#'
#' Interaction matrix between the Plant (layer A) and Seed disperser (layer B) partitions of the
#' tripartite network "Plant–Seed disperser–Parasite" (data set 10 of the database; site/system: Coimbra;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_10_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 435.
#'
#' @seealso \code{\link{dataset_10_bc}}
#'
#' @source
#' Norte, A. C., I. L. de Carvalho, J. A. Ramos, M. Gonçalves, L. Gern, and M. S. Núncio. 2012. Diversity and seasonal patterns of ticks parasitizing wild birds in western Portugal. \emph{Experimental and Applied Acarology} 58:327–339.
"dataset_10_ab"

#' Dataset 10, BC partition: Seed disperser–Parasite interactions (Coimbra)
#'
#' Interaction matrix between the Seed disperser (layer B) and Parasite (layer C) partitions of the
#' tripartite network "Plant–Seed disperser–Parasite" (data set 10 of the database; site/system: Coimbra;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_10_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 108.
#'
#' @seealso \code{\link{dataset_10_ab}}
#'
#' @source
#' Norte, A. C., I. L. de Carvalho, J. A. Ramos, M. Gonçalves, L. Gern, and M. S. Núncio. 2012. Diversity and seasonal patterns of ticks parasitizing wild birds in western Portugal. \emph{Experimental and Applied Acarology} 58:327–339.
"dataset_10_bc"

#' Dataset 11, AB partition: Plant–Herbivore interactions (Beira)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 11 of the database; site/system: Beira;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_11_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 682.
#'
#' @seealso \code{\link{dataset_11_bc}}
#'
#' @source
#' López-Núñez, F. A., R. H. Heleno, S. Ribeiro, H. Marchante, and E. Marchante. 2017. Four-trophic level food webs reveal the cascading impacts of an invasive plant targeted for biocontrol. \emph{Ecology} 98:782–793.
"dataset_11_ab"

#' Dataset 11, BC partition: Herbivore–Parasitoid interactions (Beira)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 11 of the database; site/system: Beira;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_11_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 720.
#'
#' @seealso \code{\link{dataset_11_ab}}
#'
#' @source
#' López-Núñez, F. A., R. H. Heleno, S. Ribeiro, H. Marchante, and E. Marchante. 2017. Four-trophic level food webs reveal the cascading impacts of an invasive plant targeted for biocontrol. \emph{Ecology} 98:782–793.
"dataset_11_bc"

#' Dataset 12, AB partition: Plant–Pollinator interactions (Purbeck)
#'
#' Interaction matrix between the Plant (layer A) and Pollinator (layer B) partitions of the
#' tripartite network "Plant–Pollinator–Parasitoid" (data set 12 of the database; site/system: Purbeck;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_12_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 36.
#'
#' @seealso \code{\link{dataset_12_bc}}
#'
#' @source
#' Henson, K. S. E., P. G. Craze, and J. Memmott. 2009. The restoration of parasites, parasitoids, and pathogens to heathland communities. \emph{Ecology} 90:1840–1851.
"dataset_12_ab"

#' Dataset 12, BC partition: Pollinator–Parasitoid interactions (Purbeck)
#'
#' Interaction matrix between the Pollinator (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Pollinator–Parasitoid" (data set 12 of the database; site/system: Purbeck;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_12_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 99.
#'
#' @seealso \code{\link{dataset_12_ab}}
#'
#' @source
#' Henson, K. S. E., P. G. Craze, and J. Memmott. 2009. The restoration of parasites, parasitoids, and pathogens to heathland communities. \emph{Ecology} 90:1840–1851.
"dataset_12_bc"

#' Dataset 13, AB partition: Plant–Herbivore interactions (Hawaii)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 13 of the database; site/system: Hawaii;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_13_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 896.
#'
#' @seealso \code{\link{dataset_13_bc}}
#'
#' @source
#' Henneman, M. L., and J. Memmott. 2001. Infiltration of a Hawaiian community by introduced biological control agents. \emph{Science} 293:1314–1316.
"dataset_13_ab"

#' Dataset 13, BC partition: Herbivore–Parasitoid interactions (Hawaii)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 13 of the database; site/system: Hawaii;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_13_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 91.
#'
#' @seealso \code{\link{dataset_13_ab}}
#'
#' @source
#' Henneman, M. L., and J. Memmott. 2001. Infiltration of a Hawaiian community by introduced biological control agents. \emph{Science} 293:1314–1316.
"dataset_13_bc"

#' Dataset 14, AB partition: Plant–Herbivore interactions (Bristol)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 14 of the database; site/system: Bristol;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_14_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 49623.
#'
#' @seealso \code{\link{dataset_14_bc}}
#'
#' @source
#' Macfadyen, S., R. Gibson, A. Polaszek, R. J. Morris, P. G. Craze, R. Planqué, W. O. Symondson, and J. Memmott. 2009. Do differences in food web structure between organic and conventional farms affect the ecosystem service of pest control? \emph{Ecology Letters} 12:229–238.
"dataset_14_ab"

#' Dataset 14, BC partition: Herbivore–Parasitoid interactions (Bristol)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 14 of the database; site/system: Bristol;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_14_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 30144.
#'
#' @seealso \code{\link{dataset_14_ab}}
#'
#' @source
#' Macfadyen, S., R. Gibson, A. Polaszek, R. J. Morris, P. G. Craze, R. Planqué, W. O. Symondson, and J. Memmott. 2009. Do differences in food web structure between organic and conventional farms affect the ecosystem service of pest control? \emph{Ecology Letters} 12:229–238.
"dataset_14_bc"

#' Dataset 15, AB partition: Seed disperser–Plant interactions (Poland)
#'
#' Interaction matrix between the Seed disperser (layer A) and Plant (layer B) partitions of the
#' tripartite network "Seed disperser–Plant–Pollinator" (data set 15 of the database; site/system: Poland;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_15_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 510.
#'
#' @seealso \code{\link{dataset_15_bc}}
#'
#' @source
#' Albrecht, J., D. Gertrud Berens, B. Jaroszewicz, N. Selva, R. Brandl, and N. Farwig. 2014. Correlated loss of ecosystem services in coupled mutualistic networks. \emph{Nature Communications} 5:3810.
"dataset_15_ab"

#' Dataset 15, BC partition: Plant–Pollinator interactions (Poland)
#'
#' Interaction matrix between the Plant (layer B) and Pollinator (layer C) partitions of the
#' tripartite network "Seed disperser–Plant–Pollinator" (data set 15 of the database; site/system: Poland;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_15_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 4620.
#'
#' @seealso \code{\link{dataset_15_ab}}
#'
#' @source
#' Albrecht, J., D. Gertrud Berens, B. Jaroszewicz, N. Selva, R. Brandl, and N. Farwig. 2014. Correlated loss of ecosystem services in coupled mutualistic networks. \emph{Nature Communications} 5:3810.
"dataset_15_bc"

#' Dataset 16, AB partition: Plant–Seed disperser interactions (Galapagos)
#'
#' Interaction matrix between the Plant (layer A) and Seed disperser (layer B) partitions of the
#' tripartite network "Plant–Seed disperser–Parasite" (data set 16 of the database; site/system: Galapagos;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_16_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 736.
#'
#' @seealso \code{\link{dataset_16_bc}}
#'
#' @source
#' Heleno, R., J. M. Olesen, M. Nogales, P. Vargas, and A. Traveset. 2012. Seed dispersal networks in the Galapagos and the consequences of alien plant invasions. \emph{Proceedings of the Royal Society B: Biological Sciences} 280:20122112.
"dataset_16_ab"

#' Dataset 16, BC partition: Seed disperser–Parasite interactions (Galapagos)
#'
#' Interaction matrix between the Seed disperser (layer B) and Parasite (layer C) partitions of the
#' tripartite network "Plant–Seed disperser–Parasite" (data set 16 of the database; site/system: Galapagos;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_16_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 195.
#'
#' @seealso \code{\link{dataset_16_ab}}
#'
#' @source
#' Heleno, R., J. M. Olesen, M. Nogales, P. Vargas, and A. Traveset. 2012. Seed dispersal networks in the Galapagos and the consequences of alien plant invasions. \emph{Proceedings of the Royal Society B: Biological Sciences} 280:20122112.
"dataset_16_bc"

#' Dataset 17, AB partition: Mycorrhiza–Plant interactions (Mozambique)
#'
#' Interaction matrix between the Mycorrhiza (layer A) and Plant (layer B) partitions of the
#' tripartite network "Mycorrhiza–Plant–Seed disperser" (data set 17 of the database; site/system: Mozambique;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_17_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 880.
#'
#' @seealso \code{\link{dataset_17_bc}}
#'
#' @source
#' Correia, M., S. Rodríguez-Echeverría, S. Timóteo, H. Freitas, and R. Heleno. 2019. Integrating plant species contribution to mycorrhizal and seed dispersal mutualistic networks. \emph{Biology Letters} 15:20180770.
"dataset_17_ab"

#' Dataset 17, BC partition: Plant–Seed disperser interactions (Mozambique)
#'
#' Interaction matrix between the Plant (layer B) and Seed disperser (layer C) partitions of the
#' tripartite network "Mycorrhiza–Plant–Seed disperser" (data set 17 of the database; site/system: Mozambique;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_17_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 256.
#'
#' @seealso \code{\link{dataset_17_ab}}
#'
#' @source
#' Correia, M., S. Rodríguez-Echeverría, S. Timóteo, H. Freitas, and R. Heleno. 2019. Integrating plant species contribution to mycorrhizal and seed dispersal mutualistic networks. \emph{Biology Letters} 15:20180770.
"dataset_17_bc"

#' Dataset 18, AB partition: Plant–Herbivore interactions (New Zealand)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 18 of the database; site/system: New Zealand;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_18_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 6750.
#'
#' @seealso \code{\link{dataset_18_bc}}
#'
#' @source
#' Frost, C. M., G. Peralta, T. A. Rand, R. K. Didham, A. Varsani, and J. M. Tylianakis. 2016. Apparent competition drives community-wide parasitism rates and changes in host abundance across ecosystem boundaries. \emph{Nature Communications} 7:12644.
#'
#' Peralta, G., C. M. Frost, T. A. Rand, R. K. Didham, and J. M. Tylianakis. 2014. Complementarity and redundancy of interactions enhance attack rates and spatial stability in host–parasitoid food webs. \emph{Ecology} 95:1888–1896.
#'
#' Peralta, G., C. M. Frost, R. K. Didham, and J. M. Tylianakis. 2026. Plant-herbivore-parasitoid food webs across an edge gradient from natural southern beech to plantation pine forests. \emph{Ecology} (in press).
"dataset_18_ab"

#' Dataset 18, BC partition: Herbivore–Parasitoid interactions (New Zealand)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 18 of the database; site/system: New Zealand;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_18_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 2940.
#'
#' @seealso \code{\link{dataset_18_ab}}
#'
#' @source
#' Frost, C. M., G. Peralta, T. A. Rand, R. K. Didham, A. Varsani, and J. M. Tylianakis. 2016. Apparent competition drives community-wide parasitism rates and changes in host abundance across ecosystem boundaries. \emph{Nature Communications} 7:12644.
#'
#' Peralta, G., C. M. Frost, T. A. Rand, R. K. Didham, and J. M. Tylianakis. 2014. Complementarity and redundancy of interactions enhance attack rates and spatial stability in host–parasitoid food webs. \emph{Ecology} 95:1888–1896.
#'
#' Peralta, G., C. M. Frost, R. K. Didham, and J. M. Tylianakis. 2026. Plant-herbivore-parasitoid food webs across an edge gradient from natural southern beech to plantation pine forests. \emph{Ecology} (in press).
"dataset_18_bc"

#' Dataset 19, AB partition: Plant–Herbivore interactions (Córdoba (site 1))
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 19 of the database; site/system: Córdoba (site 1);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_19_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 14541.
#'
#' @seealso \code{\link{dataset_19_bc}}
#'
#' @source
#' Cagnolo, L., A. Salvo, and G. Valladares. 2011. Network topology: patterns and mechanisms in plant-herbivore and host-parasitoid food webs. \emph{Journal of Animal Ecology} 80:342–351.
"dataset_19_ab"

#' Dataset 19, BC partition: Herbivore–Parasitoid interactions (Córdoba (site 1))
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 19 of the database; site/system: Córdoba (site 1);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_19_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 23896.
#'
#' @seealso \code{\link{dataset_19_ab}}
#'
#' @source
#' Cagnolo, L., A. Salvo, and G. Valladares. 2011. Network topology: patterns and mechanisms in plant-herbivore and host-parasitoid food webs. \emph{Journal of Animal Ecology} 80:342–351.
"dataset_19_bc"

#' Dataset 20, AB partition: Plant–Herbivore interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 20 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_20_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 9265.
#'
#' @seealso \code{\link{dataset_20_bc}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_20_ab"

#' Dataset 20, BC partition: Herbivore–Parasitoid interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 20 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_20_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 729.
#'
#' @seealso \code{\link{dataset_20_ab}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_20_bc"

#' Dataset 21, AB partition: Plant defender–Plant interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Plant defender (layer A) and Plant (layer B) partitions of the
#' tripartite network "Plant defender–Plant–Herbivore" (data set 21 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_21_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 528.
#'
#' @seealso \code{\link{dataset_21_bc}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_21_ab"

#' Dataset 21, BC partition: Plant–Herbivore interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Plant (layer B) and Herbivore (layer C) partitions of the
#' tripartite network "Plant defender–Plant–Herbivore" (data set 21 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_21_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 9265.
#'
#' @seealso \code{\link{dataset_21_ab}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_21_bc"

#' Dataset 22, AB partition: Plant–Herbivore interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Predator" (data set 22 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_22_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 9265.
#'
#' @seealso \code{\link{dataset_22_bc}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_22_ab"

#' Dataset 22, BC partition: Herbivore–Predator interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Herbivore (layer B) and Predator (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Predator" (data set 22 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_22_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 759.
#'
#' @seealso \code{\link{dataset_22_ab}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_22_bc"

#' Dataset 23, AB partition: Plant–Herbivore interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 23 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_23_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 9265.
#'
#' @seealso \code{\link{dataset_23_bc}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_23_ab"

#' Dataset 23, BC partition: Herbivore–Defender interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Herbivore (layer B) and Defender (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 23 of the database; site/system: Córdoba (site 2);
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_23_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 936.
#'
#' @seealso \code{\link{dataset_23_ab}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_23_bc"

#' Dataset 24, AB partition: Defender–Herbivore interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Defender (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Defender–Herbivore–Enemy" (data set 24 of the database; site/system: Córdoba (site 2);
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_24_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 962.
#'
#' @seealso \code{\link{dataset_24_bc}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_24_ab"

#' Dataset 24, BC partition: Herbivore–Enemy interactions (Córdoba (site 2))
#'
#' Interaction matrix between the Herbivore (layer B) and Enemy (layer C) partitions of the
#' tripartite network "Defender–Herbivore–Enemy" (data set 24 of the database; site/system: Córdoba (site 2);
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_24_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 2000.
#'
#' @seealso \code{\link{dataset_24_ab}}
#'
#' @source
#' Tavella, J., and L. Cagnolo. 2017. Disturbios ambientales como moduladores de la estructura espacial y topología de redes de interacciones mirmecófilas. PhD Thesis, Universidad Nacional de Córdoba.
"dataset_24_bc"

#' Dataset 25, AB partition: Plant–Herbivore interactions (Costa Rica)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 25 of the database; site/system: Costa Rica;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_25_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 2146.
#'
#' @seealso \code{\link{dataset_25_bc}}
#'
#' @source
#' Memmott, J., H. J. C. Godfray, and I. D. Gauld. 1994. The structure of a tropical host-parasitoid community. \emph{Journal of Animal Ecology} 63:521–540.
"dataset_25_ab"

#' Dataset 25, BC partition: Herbivore–Parasitoid interactions (Costa Rica)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 25 of the database; site/system: Costa Rica;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_25_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 5916.
#'
#' @seealso \code{\link{dataset_25_ab}}
#'
#' @source
#' Memmott, J., H. J. C. Godfray, and I. D. Gauld. 1994. The structure of a tropical host-parasitoid community. \emph{Journal of Animal Ecology} 63:521–540.
"dataset_25_bc"

#' Dataset 26, AB partition: Plant–Herbivore interactions (Müller (1999) community)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 26 of the database; site/system: Müller (1999) community;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_26_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 294.
#'
#' @seealso \code{\link{dataset_26_bc}}
#'
#' @source
#' Müller, C. B., I. C. T. Adriaanse, R. Belshaw, and H. J. C. Godfray. 1999. The structure of an aphid-parasitoid community. \emph{Journal of Animal Ecology} 68:346–370.
"dataset_26_ab"

#' Dataset 26, BC partition: Herbivore–Parasitoid interactions (Müller (1999) community)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 26 of the database; site/system: Müller (1999) community;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_26_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 252.
#'
#' @seealso \code{\link{dataset_26_ab}}
#'
#' @source
#' Müller, C. B., I. C. T. Adriaanse, R. Belshaw, and H. J. C. Godfray. 1999. The structure of an aphid-parasitoid community. \emph{Journal of Animal Ecology} 68:346–370.
"dataset_26_bc"

#' Dataset 27, AB partition: Plant–Herbivore interactions (Serengeti)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Predator" (data set 27 of the database; site/system: Serengeti;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_27_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 2967.
#'
#' @seealso \code{\link{dataset_27_bc}}
#'
#' @source
#' Baskerville, E. B., A. P. Dobson, T. Bedford, S. Allesina, T. M. Anderson, and M. Pascual. 2011. Spatial guilds in the Serengeti food web revealed by a Bayesian group model. \emph{PLoS Computational Biology} 7:e1002321.
"dataset_27_ab"

#' Dataset 27, BC partition: Herbivore–Predator interactions (Serengeti)
#'
#' Interaction matrix between the Herbivore (layer B) and Predator (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Predator" (data set 27 of the database; site/system: Serengeti;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_27_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 198.
#'
#' @seealso \code{\link{dataset_27_ab}}
#'
#' @source
#' Baskerville, E. B., A. P. Dobson, T. Bedford, S. Allesina, T. M. Anderson, and M. Pascual. 2011. Spatial guilds in the Serengeti food web revealed by a Bayesian group model. \emph{PLoS Computational Biology} 7:e1002321.
"dataset_27_bc"

#' Dataset 28, AB partition: Plant defender–Plant interactions (Dáttilo et al. (2016) sites)
#'
#' Interaction matrix between the Plant defender (layer A) and Plant (layer B) partitions of the
#' tripartite network "Plant defender–Plant–Pollinator" (data set 28 of the database; site/system: Dáttilo et al. (2016) sites;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_28_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 1200.
#'
#' @seealso \code{\link{dataset_28_bc}}
#'
#' @source
#' Dáttilo, W., N. Lara-Rodríguez, P. Jordano, P. R. Guimarães, J. N. Thompson, R. J. Marquis, L. P. Medeiros, R. Ortiz-Pulido, M. A. Marcos-García, and V. Rico-Gray. 2016. Unraveling Darwin’s entangled bank: architecture and robustness of mutualistic networks with multiple interaction types. \emph{Proceedings of the Royal Society B: Biological Sciences} 283:20161564.
"dataset_28_ab"

#' Dataset 28, BC partition: Plant–Pollinator interactions (Dáttilo et al. (2016) sites)
#'
#' Interaction matrix between the Plant (layer B) and Pollinator (layer C) partitions of the
#' tripartite network "Plant defender–Plant–Pollinator" (data set 28 of the database; site/system: Dáttilo et al. (2016) sites;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_28_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 16089.
#'
#' @seealso \code{\link{dataset_28_ab}}
#'
#' @source
#' Dáttilo, W., N. Lara-Rodríguez, P. Jordano, P. R. Guimarães, J. N. Thompson, R. J. Marquis, L. P. Medeiros, R. Ortiz-Pulido, M. A. Marcos-García, and V. Rico-Gray. 2016. Unraveling Darwin’s entangled bank: architecture and robustness of mutualistic networks with multiple interaction types. \emph{Proceedings of the Royal Society B: Biological Sciences} 283:20161564.
"dataset_28_bc"

#' Dataset 29, AB partition: Herbivore–Plant interactions (Hackett et al. (2019), HH)
#'
#' Interaction matrix between the Herbivore (layer A) and Plant (layer B) partitions of the
#' tripartite network "Herbivore–Plant–Pollinator" (data set 29 of the database; site/system: Hackett et al. (2019), HH;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_29_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 585.
#'
#' @seealso \code{\link{dataset_29_bc}}
#'
#' @source
#' Hackett, T. D., A. M. C. Sauve, N. Davies, D. Montoya, J. M. Tylianakis, and J. Memmott. 2019. Reshaping our understanding of species’ roles in landscape-scale networks. \emph{Ecology Letters} 22:1367–1377.
"dataset_29_ab"

#' Dataset 29, BC partition: Plant–Pollinator interactions (Hackett et al. (2019), HH)
#'
#' Interaction matrix between the Plant (layer B) and Pollinator (layer C) partitions of the
#' tripartite network "Herbivore–Plant–Pollinator" (data set 29 of the database; site/system: Hackett et al. (2019), HH;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_29_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 9460.
#'
#' @seealso \code{\link{dataset_29_ab}}
#'
#' @source
#' Hackett, T. D., A. M. C. Sauve, N. Davies, D. Montoya, J. M. Tylianakis, and J. Memmott. 2019. Reshaping our understanding of species’ roles in landscape-scale networks. \emph{Ecology Letters} 22:1367–1377.
"dataset_29_bc"

#' Dataset 30, AB partition: Plant–Herbivore interactions (Hackett et al. (2019), HH)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 30 of the database; site/system: Hackett et al. (2019), HH;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_30_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 585.
#'
#' @seealso \code{\link{dataset_30_bc}}
#'
#' @source
#' Hackett, T. D., A. M. C. Sauve, N. Davies, D. Montoya, J. M. Tylianakis, and J. Memmott. 2019. Reshaping our understanding of species’ roles in landscape-scale networks. \emph{Ecology Letters} 22:1367–1377.
"dataset_30_ab"

#' Dataset 30, BC partition: Herbivore–Parasitoid interactions (Hackett et al. (2019), HH)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 30 of the database; site/system: Hackett et al. (2019), HH;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_30_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 238.
#'
#' @seealso \code{\link{dataset_30_ab}}
#'
#' @source
#' Hackett, T. D., A. M. C. Sauve, N. Davies, D. Montoya, J. M. Tylianakis, and J. Memmott. 2019. Reshaping our understanding of species’ roles in landscape-scale networks. \emph{Ecology Letters} 22:1367–1377.
"dataset_30_bc"

#' Dataset 31, AB partition: Plant–Herbivore interactions (Great Smoky Mountains)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 31 of the database; site/system: Great Smoky Mountains;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_31_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 11640.
#'
#' @seealso \code{\link{dataset_31_bc}}
#'
#' @source
#' Favret, C., J. J. Duggan, N. J. Sanders, and R. L. Phillippe. 2010. Actual and inferred checklist of the aphids (Hemiptera: Aphididae) of the Great Smoky Mountains National Park, with attendant ant and host plant associations. \emph{Proceedings of the Entomological Society of Washington} 112:381–403.
"dataset_31_ab"

#' Dataset 31, BC partition: Herbivore–Defender interactions (Great Smoky Mountains)
#'
#' Interaction matrix between the Herbivore (layer B) and Defender (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 31 of the database; site/system: Great Smoky Mountains;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_31_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 190.
#'
#' @seealso \code{\link{dataset_31_ab}}
#'
#' @source
#' Favret, C., J. J. Duggan, N. J. Sanders, and R. L. Phillippe. 2010. Actual and inferred checklist of the aphids (Hemiptera: Aphididae) of the Great Smoky Mountains National Park, with attendant ant and host plant associations. \emph{Proceedings of the Entomological Society of Washington} 112:381–403.
"dataset_31_bc"

#' Dataset 32, AB partition: Herbivore–Plant interactions (Shinohara et al. (2019) sites)
#'
#' Interaction matrix between the Herbivore (layer A) and Plant (layer B) partitions of the
#' tripartite network "Herbivore–Plant–Pollinator" (data set 32 of the database; site/system: Shinohara et al. (2019) sites;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_32_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 5394.
#'
#' @seealso \code{\link{dataset_32_bc}}
#'
#' @source
#' Shinohara, N., K. Uchida, and T. Yoshida. 2019. Contrasting effects of land-use changes on herbivory and pollination networks. \emph{Ecology and Evolution} 9:13585–13595.
"dataset_32_ab"

#' Dataset 32, BC partition: Plant–Pollinator interactions (Shinohara et al. (2019) sites)
#'
#' Interaction matrix between the Plant (layer B) and Pollinator (layer C) partitions of the
#' tripartite network "Herbivore–Plant–Pollinator" (data set 32 of the database; site/system: Shinohara et al. (2019) sites;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_32_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 2496.
#'
#' @seealso \code{\link{dataset_32_ab}}
#'
#' @source
#' Shinohara, N., K. Uchida, and T. Yoshida. 2019. Contrasting effects of land-use changes on herbivory and pollination networks. \emph{Ecology and Evolution} 9:13585–13595.
"dataset_32_bc"

#' Dataset 33, AB partition: Pollinator–Plant interactions (Vitali et al. (2022) sites)
#'
#' Interaction matrix between the Pollinator (layer A) and Plant (layer B) partitions of the
#' tripartite network "Pollinator–Plant–Seed disperser" (data set 33 of the database; site/system: Vitali et al. (2022) sites;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_33_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 3230.
#'
#' @seealso \code{\link{dataset_33_bc}}
#'
#' @source
#' Vitali, A., Y. Sasal, D. P. Vázquez, M. F. Miguel, and M. A. Rodríguez-Cabal. 2022. The disruption of a keystone interaction erodes pollination and seed dispersal networks. \emph{Ecology} 103:e03547.
"dataset_33_ab"

#' Dataset 33, BC partition: Plant–Seed disperser interactions (Vitali et al. (2022) sites)
#'
#' Interaction matrix between the Plant (layer B) and Seed disperser (layer C) partitions of the
#' tripartite network "Pollinator–Plant–Seed disperser" (data set 33 of the database; site/system: Vitali et al. (2022) sites;
#' configuration: non-stacked). The complementary matrix of the same network is
#' \code{\link{dataset_33_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 40.
#'
#' @seealso \code{\link{dataset_33_ab}}
#'
#' @source
#' Vitali, A., Y. Sasal, D. P. Vázquez, M. F. Miguel, and M. A. Rodríguez-Cabal. 2022. The disruption of a keystone interaction erodes pollination and seed dispersal networks. \emph{Ecology} 103:e03547.
"dataset_33_bc"

#' Dataset 34, AB partition: Plant–Herbivore interactions (Zhang et al. (2023) sites)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 34 of the database; site/system: Zhang et al. (2023) sites;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_34_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 984.
#'
#' @seealso \code{\link{dataset_34_bc}}
#'
#' @source
#' Zhang, X., B. Dalsgaard, M. Staab, C. Zhu, Y. Zhao, F. Gonçalves, P. Ren, C. Cai, G. Qiao, P. Ding, and S. Xingfeng. 2023. Habitat fragmentation increases the specialization of multi-trophic interactions by high species turnover. \emph{Proceedings of the Royal Society B} 290:20231372.
"dataset_34_ab"

#' Dataset 34, BC partition: Herbivore–Defender interactions (Zhang et al. (2023) sites)
#'
#' Interaction matrix between the Herbivore (layer B) and Defender (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Defender" (data set 34 of the database; site/system: Zhang et al. (2023) sites;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_34_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 700.
#'
#' @seealso \code{\link{dataset_34_ab}}
#'
#' @source
#' Zhang, X., B. Dalsgaard, M. Staab, C. Zhu, Y. Zhao, F. Gonçalves, P. Ren, C. Cai, G. Qiao, P. Ding, and S. Xingfeng. 2023. Habitat fragmentation increases the specialization of multi-trophic interactions by high species turnover. \emph{Proceedings of the Royal Society B} 290:20231372.
"dataset_34_bc"

#' Dataset 35, AB partition: Plant–Herbivore interactions (Araujo & Maia (2021) restinga)
#'
#' Interaction matrix between the Plant (layer A) and Herbivore (layer B) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 35 of the database; site/system: Araujo & Maia (2021) restinga;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_35_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 3520.
#'
#' @seealso \code{\link{dataset_35_bc}}
#'
#' @source
#' Araujo, W., and V. Maia. 2021. Topological structure of a tritrophic network composed of host plants, gall-inducing insects and parasitoids in a restinga area in Brazil. \emph{Entomological Science} 24:201–216.
"dataset_35_ab"

#' Dataset 35, BC partition: Herbivore–Parasitoid interactions (Araujo & Maia (2021) restinga)
#'
#' Interaction matrix between the Herbivore (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Herbivore–Parasitoid" (data set 35 of the database; site/system: Araujo & Maia (2021) restinga;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_35_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 4012.
#'
#' @seealso \code{\link{dataset_35_ab}}
#'
#' @source
#' Araujo, W., and V. Maia. 2021. Topological structure of a tritrophic network composed of host plants, gall-inducing insects and parasitoids in a restinga area in Brazil. \emph{Entomological Science} 24:201–216.
"dataset_35_bc"

#' Dataset 36, AB partition: Plant–Pulp feeder interactions (Basset et al. (2021), BCI)
#'
#' Interaction matrix between the Plant (layer A) and Pulp feeder (layer B) partitions of the
#' tripartite network "Plant–Pulp feeder–Parasitoid" (data set 36 of the database; site/system: Basset et al. (2021), BCI;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_36_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 33598.
#'
#' @seealso \code{\link{dataset_36_bc}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_36_ab"

#' Dataset 36, BC partition: Pulp feeder–Parasitoid interactions (Basset et al. (2021), BCI)
#'
#' Interaction matrix between the Pulp feeder (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Pulp feeder–Parasitoid" (data set 36 of the database; site/system: Basset et al. (2021), BCI;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_36_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 570.
#'
#' @seealso \code{\link{dataset_36_ab}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_36_bc"

#' Dataset 37, AB partition: Plant–Seed predator interactions (Basset et al. (2021), BCI)
#'
#' Interaction matrix between the Plant (layer A) and Seed predator (layer B) partitions of the
#' tripartite network "Plant–Seed predator–Parasitoid" (data set 37 of the database; site/system: Basset et al. (2021), BCI;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_37_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 56291.
#'
#' @seealso \code{\link{dataset_37_bc}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_37_ab"

#' Dataset 37, BC partition: Seed predator–Parasitoid interactions (Basset et al. (2021), BCI)
#'
#' Interaction matrix between the Seed predator (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Seed predator–Parasitoid" (data set 37 of the database; site/system: Basset et al. (2021), BCI;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_37_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 1484.
#'
#' @seealso \code{\link{dataset_37_ab}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_37_bc"

#' Dataset 38, AB partition: Plant–Pulp feeder interactions (Basset et al. (2021), KHC)
#'
#' Interaction matrix between the Plant (layer A) and Pulp feeder (layer B) partitions of the
#' tripartite network "Plant–Pulp feeder–Parasitoid" (data set 38 of the database; site/system: Basset et al. (2021), KHC;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_38_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 27370.
#'
#' @seealso \code{\link{dataset_38_bc}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_38_ab"

#' Dataset 38, BC partition: Pulp feeder–Parasitoid interactions (Basset et al. (2021), KHC)
#'
#' Interaction matrix between the Pulp feeder (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Pulp feeder–Parasitoid" (data set 38 of the database; site/system: Basset et al. (2021), KHC;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_38_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 288.
#'
#' @seealso \code{\link{dataset_38_ab}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_38_bc"

#' Dataset 39, AB partition: Plant–Pulp feeder interactions (Basset et al. (2021), WAN)
#'
#' Interaction matrix between the Plant (layer A) and Pulp feeder (layer B) partitions of the
#' tripartite network "Plant–Pulp feeder–Parasitoid" (data set 39 of the database; site/system: Basset et al. (2021), WAN;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_39_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 35512.
#'
#' @seealso \code{\link{dataset_39_bc}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_39_ab"

#' Dataset 39, BC partition: Pulp feeder–Parasitoid interactions (Basset et al. (2021), WAN)
#'
#' Interaction matrix between the Pulp feeder (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Pulp feeder–Parasitoid" (data set 39 of the database; site/system: Basset et al. (2021), WAN;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_39_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 1938.
#'
#' @seealso \code{\link{dataset_39_ab}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_39_bc"

#' Dataset 40, AB partition: Plant–Seed predator interactions (Basset et al. (2021), WAN)
#'
#' Interaction matrix between the Plant (layer A) and Seed predator (layer B) partitions of the
#' tripartite network "Plant–Seed predator–Parasitoid" (data set 40 of the database; site/system: Basset et al. (2021), WAN;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_40_bc}}.
#'
#' @format An object of class \code{matrix/array} of length 10164.
#'
#' @seealso \code{\link{dataset_40_bc}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_40_ab"

#' Dataset 40, BC partition: Seed predator–Parasitoid interactions (Basset et al. (2021), WAN)
#'
#' Interaction matrix between the Seed predator (layer B) and Parasitoid (layer C) partitions of the
#' tripartite network "Plant–Seed predator–Parasitoid" (data set 40 of the database; site/system: Basset et al. (2021), WAN;
#' configuration: stacked). The complementary matrix of the same network is
#' \code{\link{dataset_40_ab}}.
#'
#' @format An object of class \code{matrix/array} of length 96.
#'
#' @seealso \code{\link{dataset_40_ab}}
#'
#' @source
#' Basset, Y., L. R. Jorge, P. T. Butterill, G. P. A. Lamarre, C. Dahl, R. Ctvrtecka, S. Gripenberg, O. T. Lewis, H. Barrios, J. W. Brown, S. Bunyavejchewin, B. A. Butcher, A. I. Cognato, S. J. Davies, O. Kaman, P. Klimes, M. Knížek, S. E. Miller, G. E. Morse, V. Novotny, N. Pongpattananurak, P. Pramual, D. L. J. Quicke, W. Sakchoowong, R. Umari, E. J. Vesterinen, G. Weiblen, S. J. Wright, and S. T. Segar. 2021. Host specificity and interaction networks of insects feeding on seeds and fruits in tropical rainforests. \emph{Oikos} 130:1462–1476.
"dataset_40_bc"
