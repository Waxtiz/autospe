#' Graphique de raréfaction et richesse cumulé
#'
#' Créer un graphique de la raréfaction - calculé à l'aide du package vegan - et de la richesse spécifique cumulé depuis un jeu de données au format long
#' x = Vart
#'
#' @return data.frame en format "wide"
#'
#'
#' @param dataset Jeu de données en format long / data.frame
#' @param VarSp Variable comprenant les especes / factor
#' @param VarT Variable de groupe : session, transects, sites, dates / int
#' @param Occ Facultatif : Variable du nombre d'individu observé / int
#'
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 geom_ribbon
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_point
#'
#' @export


My.plot.T <- function(dataset, VarSp, VarT, Occ) {

  ggsp2<-My.all(dataset, VarSp, VarT, Occ)



  plot<-ggplot(ggsp2)+
    geom_line(aes(x=VarT, y=Rich), color='red')+
    geom_line(aes(x=VarT, y=Richness), color='blue',linetype = "dashed")+
    geom_ribbon(aes(x=VarT, y=Richness, ymin=(Richness-SD),ymax=(Richness+SD)),alpha=0.1, fill='blue')+
    geom_point(aes(x=VarT, y=Richness), color='blue')

  return(plot)

}
