#'Extrapolation du nombre d'espèces observable
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



My.extrapo <- function(dataset, VarSp, VarT, Occ) {

  df<-My.matrice(dataset, VarSp, VarT, Occ)

  df[,-1]

  sp1<-specpool(df)


  return(sp1)
}
