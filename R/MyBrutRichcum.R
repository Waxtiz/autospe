#' Calcul de la richesse cumulée
#'
#' Créer une matrice -architecture attendu par le package vegan- depuis un jeu de données au format long,
#' et calcul en dernière colonne la richesse cumulé
#'
#' @return data.frame en format "wide"
#'
#'
#' @param dataset Jeu de données en format long / data.frame
#' @param VarSp Variable comprenant les especes / factor
#' @param VarT Variable de groupe : session, transects, sites, dates / int
#' @param Occ Facultatif : Variable du nombre d'individu observé / int
#'
#'
#' @export

My.brut.RichCum <- function(dataset, VarSp, VarT, Occ) {

  df<-My.matrice(dataset, VarSp, VarT, Occ)


  Rich <- df %>%
    apply(2, cumsum) %>%
    apply(1, function (x) sum(x > 0))
  df$Rich <- unlist(Rich)


  return(df)
}
