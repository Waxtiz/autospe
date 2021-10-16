#' Graphique de raréfaction et richesse cumulé
#'
#' Créer un graphique de la raréfaction - calculé à l'aide du package vegan - et de la richesse spécifique cumulé depuis un jeu de données au format long.
#' x = les identifiants de VarT
#'
#' @return graphique des courbes de la richesse cumulé et de la raréfaction classé par les identifiants
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
#' @importFrom ggplot2 scale_color_manual
#' @importFrom ggplot2 scale_fill_manual
#' @importFrom ggplot2 scale_x_continuous
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 theme_classic
#'
#' @export


My.plot.id <- function(dataset, VarSp, VarT, Occ) {

  ggsp2<-My.all(dataset, VarSp, VarT, Occ)

  plot1<-ggplot(ggsp2, aes(x=id))+
    geom_line(aes(y=Rich, color="Cumulative species richness")) +
    geom_line(aes(y=Richness, color="Rarefaction"),linetype = "dashed")+
    geom_point(aes(y=Richness, color="Rarefaction"))+
    geom_ribbon(aes(y=Richness, ymin=(Richness-SD),ymax=(Richness+SD), fill="SD of rarefaction"),alpha=0.1)+
    scale_color_manual(name = "", values = c("Rarefaction" = "blue", "Cumulative species richness" = "red"))+
    scale_fill_manual(name = "", values = c("SD of rarefaction" = "blue")) +
    scale_x_continuous("Sessions", breaks = ggsp2$id)+
    ylab("Richness of species")+
    theme_classic()

  return(plot1)

}
