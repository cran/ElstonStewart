\name{es.pedigree}
\alias{es.pedigree}
\alias{print.es.pedigree}
\title{Creates a pedigree} 
\description{Creates a pedigree from vectors giving individuals' id, fathers' id, mothers' is, sex, phenotype and genotype}
\usage{es.pedigree(id, father, mother, sex, pheno, geno, famid)}
\arguments{
  \item{id}{a numeric vector of unique individuals id. Ids must be different from 0}
  \item{father}{a vector giving the id of the father of each individual (0 for founder)}
  \item{mother}{a vector giving the id of the mother of each individual (0 for founder)}
  \item{sex}{a vector giving the sex of each individual (1 = male, 2 = female)}
  \item{pheno}{a list giving the phenotypes of each individual}
  \item{geno}{a list giving the genotypes of each individual}
  \item{famid}{(facultative) a family id, used only to issue error messages}
}
\details{All vectors must have the same length, including the lists \code{pheno} and \code{geno}. The list \code{geno} is a list 
of vectors containing the possible genotypes of each individual. The format of \code{pheno} depends on the modele which will
be used to compute likelihoods with \code{Elston} or \code{Likelihood}.} 
\value{An object of class S3 \code{es.pedigree}}
\seealso{\code{\link{plot.es.pedigree}}}
\examples{
## cf Elston-Stewart vignette for more coments on this example
data(conrad2)
# creating an es.pedigree object
genotypes <- c( rep(list(0:2), 21), 2 )

X <- es.pedigree( id = conrad2$id, father = conrad2$father, mother = conrad2$mother,
      sex = conrad2$sex, pheno = rep(0, 22), geno = genotypes )
X  # displays a short information on X
}

