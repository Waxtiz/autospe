#' Créer une matrice
#'
#' Créer une matrice -architeture attendu par le package vegan- depuis un jeu de données au format long
#'
#' @return data.frame en format "wide"
#'
#'
#' @param dataset Jeu de données en format long / data.frame
#' @param VarSp Variable comprenant les especes / factor
#' @param VarT Variable de groupe : session, transects, sites, dates / int
#' @param Occ Facultatif : Variable du nombre d'individu observé / int
#'
#' @importFrom stats aggregate
#' @importFrom tidyr pivot_wider
#' @importFrom magrittr %>%
#'
#' @export



My.matrice <- function(dataset, VarSp, VarT, Occ) {

  if(missing(Occ)) {

    df<-data.frame(dataset[,VarT],dataset[,VarSp])

    colnames(df)[1]<-"VarT"
    colnames(df)[2]<-"VarSp"

    df <- unique(df[ , 1:2 ] )

    df$Occ<-1

  } else {

    df<-data.frame(dataset[,VarT],dataset[,VarSp], dataset[,Occ])

    colnames(df)[1]<-"VarT"
    colnames(df)[2]<-"VarSp"
    colnames(df)[3]<-"occ"

    df <- aggregate(occ ~ VarSp+VarT, df, sum)

  }


  df<-df[!df[,2]=="",]

  df <- df %>%
    pivot_wider(names_from = VarSp, values_from = Occ)

  df[is.na(df)] <- 0

  df<-df[order(df$VarT),]



  return(df)
}
