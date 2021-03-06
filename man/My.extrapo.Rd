% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Myextrapo.R
\name{My.extrapo}
\alias{My.extrapo}
\title{Extrapolation du nombre d'espèces}
\usage{
My.extrapo(dataset, VarSp, VarT, Occ)
}
\arguments{
\item{dataset}{Jeu de données en format long / data.frame}

\item{VarSp}{Variable comprenant les especes / factor}

\item{VarT}{Variable de groupe : session, transects, sites, dates / int}

\item{Occ}{Facultatif : Variable du nombre d'individu observé / int}
}
\value{
data.frame en format "wide"
}
\description{
Extrapolation du nombre d'espèces attendu avec la fonction specpool du package vegan depuis un jeu de données au format long
}
