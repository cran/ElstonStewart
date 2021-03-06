\name{Likelihood}
\alias{Likelihood}
\title{Compute the log-likelihood of a parameter}
\description{Compute the log-likelihood of a parameter \code{theta}, given a list of pedigrees and a modele, using multiple cores and memoization}
\usage{Likelihood(ped.set, modele, theta, 
                  n.cores = getOption("mc.cores", 2L), 
                  optim.alloc = TRUE, sum.likelihoods = TRUE,
                  PSOCK = Sys.info()["sysname"] != "Linux")}
\arguments{
  \item{ped.set}{a list of pedigrees, each created with \code{es.pedigree}}
  \item{modele}{a modele}
  \item{theta}{a parameter for the modele}
  \item{n.cores}{number of cores on which to run the computation}
  \item{optim.alloc}{cf Details}
  \item{sum.likelihoods}{cf Value}
  \item{PSOCK}{Use PSOCK cluster instead of fork cluster (defaults to \code{TRUE} on non-Linux)}
}
\details{
The parameter \code{theta} will be given to the functions in \code{modele} to compute the likelihoods.

If \code{n.cores > 1} a cluster is created and left open for futur use with
the same parameters \code{ped.set} and \code{modele}. Open clusters can be closed
with \code{es.stopCluster()}.

If \code{optim.alloc = TRUE}, the function tries to optimize the distribution of 
the computation (if \code{n.cores > 1}) between the cluster nodes. This has no effect on the first run  
for given parameters \code{ped.set} and \code{modele}, but will reduce running time if the algorithm is ran several times 
with different values of \code{theta} and same parameters \code{ped.set} and \code{modele}.
This is typically usefull for likelihood maximization.
}
\value{If \code{sum.likelihoods = TRUE}, the function returns a single value, the sum of the 
log-likelihoods computed for each pedigree of \code{ped.set}. Else, the function 
returns a vector containing these log-likelihoods.}
\seealso{\code{\link{Elston}}, \code{\link{es.pedigree}}, \code{\link{es.stopCluster}}}
\examples{
data(fams)

# this data frame contains various families
# getting their famid
fam.ids <- unique(fams$fam);

# creating a list of genotypes corresponding to all individuals in fams
# NA -> 0, 1 or 2
genotypes <- lapply( fams$genotype, function(x) if(is.na(x)) 0:2 else x )

# creating a list of es.pedigree objects
X <- vector("list", length(fam.ids))
for(i in seq_along(fam.ids))
{
  w <- which(fams$fam == fam.ids[i])
  X[[i]] <- es.pedigree( id = fams$id[w], father = fams$father[w],
      mother = fams$mother[w], sex = fams$sex[w], pheno = rep(0, length(w)), 
      geno = genotypes[w], famid = fam.ids[i] )
}

\dontrun{# computing the likelihood for a single value p
Likelihood(X, modele.di, theta = list( p=0.5), n.cores=1 )

# computing the likelihood for a vector p (Elston-Stewart is ran only once!)
p <- seq(0,1,length=501)
L <- Likelihood(X, modele.di, theta = list( p=p ), n.cores=1 ) 
plot( p, exp(L), type="l")

# running an optimization algorithm
# Elston-Stewart is ran several times
# here we run the algorithm with 2 cores
L <- function(p) -Likelihood(X, modele.di, theta = list( p=p ), n.cores=2 ) 
optimize(L , c(0.35,0.45) )}
}
