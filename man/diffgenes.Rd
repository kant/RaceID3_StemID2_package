% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RaceID.R
\name{diffgenes}
\alias{diffgenes}
\title{Compute Expression Differences between Clusters}
\usage{
diffgenes(object, cl1, cl2, mincount = 1)
}
\arguments{
\item{object}{\code{SCseq} class object.}

\item{cl1}{A vector of valid cluster numbers (contained in the \code{cpart} slot of the \code{SCseq} object). Represents the first group of the comparison.}

\item{cl2}{A vector of valid cluster numbers (contained in the \code{cpart} slot of the \code{SCseq} object). Represents the second group of the comparison.}

\item{mincount}{Minimal normalized expression level of a gene to be included into the analysis. A gene needs to be expressed at this level in at least a single cell.}
}
\value{
A list with four components:
  \item{z}{a vector of z-scores in decreasing order with genes up-regulated in \code{cl1} appearing at the top of the list.}
  \item{cl1}{a \code{data.frame} with expression values for cells in \code{cl1}.}
  \item{cl2}{a \code{data.frame} with expression values for cells in \code{cl2}.}
  \item{cl1n}{a vector of cluster numbers for cells in \code{cl1}.}
  \item{cl2n}{a vector of cluster numbers for cells in \code{cl2}.}
}
\description{
This functions computes expression differences between clusters and ranks genes by z-score differences.
}
\examples{
sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
x <- diffgenes(sc,1,2)
head(x$z)
plotdiffgenes(x,names(x$z)[1])
}
