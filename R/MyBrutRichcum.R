#'Calcul de la richesse spécifique cumulé
#'
#'
#'
#'My.matrice(dataset, VarSp, VarT, Occ)
#'
#'
#' @import tidyverse
#'
#' @param dataset data
#' @param VarSp data
#' @param VarT data
#' @param Occ data
#'
#' @export
#'
My.brut.RichCum <- function(dataset, VarSp, VarT, Occ) {

  df<-My.matrice(dataset, VarSp, VarT, Occ)


  Rich <- df %>%
    apply(2, cumsum) %>%
    apply(1, function (x) sum(x > 0))
  df$Rich <- unlist(Rich)


  return(df)
}
