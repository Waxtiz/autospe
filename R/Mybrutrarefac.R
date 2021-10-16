#' Calcul de la raréfaction
#'
#' Créer une matrice -architecture attendu par le package vegan- depuis un jeu de données au format long,
#' et calcul en dernière colonne la raréfaction en utilisant specaccum du package vegan
#'
#' @return data.frame en format "wide"
#'
#'
#' @param dataset Jeu de données en format long / data.frame
#' @param VarSp Variable comprenant les especes / factor
#' @param VarT Variable de groupe : session, transects, sites, dates / int
#' @param Occ Facultatif : Variable du nombre d'individu observé / int
#'
#' @importFrom vegan specaccum
#'
#' @export

My.brut.Rarefac <- function(dataset, VarSp, VarT, Occ) {

  df<-My.matrice(dataset, VarSp, VarT, Occ)

  df[,-1]


  sp1<-specaccum(df)
  ggsp<-data.frame(Sites=sp1$sites, Richness=sp1$richness, SD=sp1$sd)


  return(ggsp)
}
