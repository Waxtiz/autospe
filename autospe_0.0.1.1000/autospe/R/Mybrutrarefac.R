#'Calcul de la raréfaction
#'
#'
#'
#'My.matrice(dataset, VarSp, VarT, Occ)
#'
#'
#' @import tidyverse
#' @import vegan
#'
#' @param dataset data
#' @param VarSp data
#' @param VarT data
#' @param Occ data
#'
#' @export
#'
#'
#'
My.brut.Rarefac <- function(dataset, VarSp, VarT, Occ) {

  df<-My.matrice(dataset, VarSp, VarT, Occ)

  df[,-1]


  sp1<-specaccum(df)
  ggsp<-data.frame(Sites=sp1$sites, Richness=sp1$richness, SD=sp1$sd)


  return(ggsp)
}
