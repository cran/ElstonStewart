\docType{package}
\name{ElstonStewart-package}
\alias{ElstonStewart}
\alias{ElstonStewart-package}
\alias{modele.di}
\title{Elston-Stewart package} 
\description{A flexible implementation of the Elston-Stewart algorithm}
\details{The Elston-Stewart algorithm allows to compute probability functions in pedigrees.

The function \code{\link{es.pedigree}} allows to create S3 objects for pedigrees. They can be
plotted with a S3 method \code{\link{plot.es.pedigree}} which is simply a wrapper for the
method provided in \code{kinship2}.

The algorithm itself is run by two functions, \code{\link{Elston}} and  \code{\link{Likelihood}}.
\code{Elston} computes a probability for a single pedigree, given a probability model (similar
to the one given in \code{modele.di}). It relies on memoization (or dynamic programming)
and allows vectorization (computing a vector of probabilities at once). \code{\link{Likelihood}}
is similar, but runs on pedigrees lists: it computes (the sum of) the logarithms of the probabilities 
for each pedigree. It allows parallelization, running the computation for the various
pedigrees on different nodes of a cluster. The cluster is left opened for being re-used 
(with memoization) on the same set of pedigrees. It can be closed with \code{\link{es.stopCluster}}.

Two small data sets are provided for illustration, \code{\link{conrad2}} and \code{\link{fams}}.
The Elston-Stewart vignette gives commented examples.
}
\author{Herve Perdry \email{herve.perdry@u-psud.fr}}

