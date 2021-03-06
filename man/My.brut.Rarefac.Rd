% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Mybrutrarefac.R
\name{My.brut.Rarefac}
\alias{My.brut.Rarefac}
\title{Calcul de la raréfaction}
\usage{
My.brut.Rarefac(dataset, VarSp, VarT, Occ)
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
Créer une matrice -architecture attendu par le package vegan- depuis un jeu de données au format long,
et calcul en dernière colonne la raréfaction en utilisant specaccum du package vegan
}
