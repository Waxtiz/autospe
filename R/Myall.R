#' Calcul la richesse cumulé et de la raréfaction
#'
#' Créer une matrice -architecture attendu par le package vegan- depuis un jeu de données au format long,
#' et calcul la raréfaction en utilisant specaccum du package vegan et la richesse cumulée
#'
#' @return data.frame en format "wide"
#'
#'
#' @param dataset Jeu de données en format long / data.frame
#' @param VarSp Variable comprenant les especes / factor
#' @param VarT Variable de groupe : session, transects, sites, dates / int
#' @param Occ Facultatif : Variable du nombre d'individu observé / int
#'
#' @importFrom dplyr left_join
#'
#' @export


My.all <- function(dataset, VarSp, VarT, Occ) {

  df<-My.brut.RichCum(dataset, VarSp, VarT, Occ)
  ggsp<-My.brut.Rarefac(dataset, VarSp, VarT, Occ)


  df<-df[order(df$VarT),]
  ggsp<-ggsp[order(ggsp$Sites),]

  df$id <- seq_len(nrow(df))

  ggsp2<-left_join(df,ggsp,by=c("id"="Sites"))

  return(ggsp2)

}
