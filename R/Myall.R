#'Calcul de la richesse cumulé & raréfaction
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

My.all <- function(dataset, VarSp, VarT, Occ) {

  df<-My.brut.RichCum(dataset, VarSp, VarT, Occ)
  ggsp<-My.brut.Rarefac(dataset, VarSp, VarT, Occ)


  df<-df[order(df$VarT),]
  ggsp<-ggsp[order(ggsp$Sites),]

  df$id <- seq_len(nrow(df))

  ggsp2<-left_join(df,ggsp,by=c("id"="Sites"))

  return(ggsp2)

}
