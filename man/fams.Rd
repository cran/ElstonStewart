\name{fams}
\alias{fams}
\docType{data}
\title{ The pedigree of Conrad II, Holy Roman Emperor }
\description{
  A pedigree with imbreding used in examples
}
\usage{data(conrad2)}
\format{
  A data frame with 802 lines with the following variables.
  \describe{
    \item{\code{fam}}{family id}
    \item{\code{id}}{subject id}
    \item{\code{father}}{id of the subject's father}
    \item{\code{mother}}{id of the subject's mother}
    \item{\code{sex}}{1=male, 2=female}
    \item{\code{genotype}}{coded additively. Many genotypes are unkwnon (\code{NA})}
  }
}
\examples{
data(fams)
}
\keyword{datasets}

