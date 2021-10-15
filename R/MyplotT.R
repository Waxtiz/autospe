#'Graphique richesse cumulé & raréfaction x=T
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

My.plot.T <- function(dataset, VarSp, VarT, Occ) {

  ggsp2<-My.all(dataset, VarSp, VarT, Occ)



  plot<-ggplot(ggsp2)+
    geom_line(aes(x=VarT, y=Rich), color='red')+
    geom_line(aes(x=VarT, y=Richness), color='blue',linetype = "dashed")+
    geom_ribbon(aes(x=VarT, y=Richness, ymin=(Richness-SD),ymax=(Richness+SD)),alpha=0.1, fill='blue')+
    geom_point(aes(x=VarT, y=Richness), color='blue')

  return(plot)

}
