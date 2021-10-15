#'Créer une matrice a partir d'un jeu données format "long"
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



My.matrice <- function(dataset, VarSp, VarT, Occ) {

  if(missing(Occ)) {

    df<-data.frame(dataset[,VarT],dataset[,VarSp])

    colnames(df)[1]<-"VarT"
    colnames(df)[2]<-"VarSp"

    df <- unique(df[ , 1:2 ] )

    df$occ<-1

  } else {

    df<-data.frame(dataset[,VarT],dataset[,VarSp], dataset[,Occ])

    colnames(df)[1]<-"VarT"
    colnames(df)[2]<-"VarSp"
    colnames(df)[3]<-"occ"

    df <- aggregate(occ ~ VarSp+VarT, df, sum)

  }


  df<-df[!df[,2]=="",]

  df <- df %>%
    pivot_wider(names_from = VarSp, values_from = occ)

  df[is.na(df)] <- 0

  df<-df[order(df$VarT),]



  return(df)
}
