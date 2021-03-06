\name{Elston}
\alias{Elston}
\title{Compute a probability function on a pedigree} 
\description{Compute the probability of a pedigree, for a parameter \code{theta} and a given modele}
\usage{Elston(ped, modele, theta, mem = new.env())}
\arguments{
  \item{ped}{a pedigree, created by \code{es.pedigree}}
  \item{modele}{a modele}
  \item{theta}{a parameter for the modele}
  \item{mem}{an environment used for memoization}
}
\details{This function runs Elston-Stewart algorithm. If \code{mem} is provided, some intermediate results of previous runs stored in it can be re-used.}
\value{A list with two components, \code{result}: the probability value, and \code{mem}: an object storing intermediate results for future runs}
\seealso{\code{\link{Likelihood}}, \code{\link{es.pedigree}}}
\examples{
## cf Elston-Stewart vignette for more coments on this example
data(conrad2)
# creating an es.pedigree object
genotypes <- c( rep(list(0:2), 21), 2 )

X <- es.pedigree( id = conrad2$id, father = conrad2$father, mother = conrad2$mother, 
      sex = conrad2$sex, pheno = rep(0, 22), geno = genotypes )

# running Elston-Stewart
r <- Elston(X, modele.di, list(p = 0.98))
r$result

# using the memoization...
r <- Elston(X, modele.di, list(p = 0.99), r$mem)
r$result
}

