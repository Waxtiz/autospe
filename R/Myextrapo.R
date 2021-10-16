#' Extrapolation du nombre d'espèces
#'
#' Extrapolation du nombre d'espèces attendu avec la fonction specpool du package vegan depuis un jeu de données au format long
#'
#' @return data.frame en format "wide"
#'
#'
#' @param dataset Jeu de données en format long / data.frame
#' @param VarSp Variable comprenant les especes / factor
#' @param VarT Variable de groupe : session, transects, sites, dates / int
#' @param Occ Facultatif : Variable du nombre d'individu observé / int
#'
#' @importFrom vegan specpool
#'
#' @export



My.extrapo <- function(dataset, VarSp, VarT, Occ) {

  df<-My.matrice(dataset, VarSp, VarT, Occ)

  df[,-1]

  sp1<-specpool(df)


  return(sp1)
}
