#'Graphique richesse cumulé & raréfaction x=ID
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

My.plot.id <- function(dataset, VarSp, VarT, Occ) {

  ggsp2<-My.all(dataset, VarSp, VarT, Occ)

  plot<-ggplot(ggsp2)+
    geom_line(aes(x=id, y=Rich), color='red')+
    geom_line(aes(x=id, y=Richness), color='blue',linetype = "dashed")+
    geom_ribbon(aes(x=id, y=Richness, ymin=(Richness-SD),ymax=(Richness+SD)),alpha=0.1, fill='blue')+
    geom_point(aes(x=id, y=Richness), color='blue')

  return(plot)

}
