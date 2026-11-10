\name{plotYangGamma}
\alias{plotYangGamma}
\title{Plot Gamma Distributions for Among-Site Rate Variation}
\description{
Plots gamma probability density curves for different shape parameters.
Each distribution has a mean of one.
}
\usage{
plotYangGamma(x, file = NULL, col = NULL, ..., ylim = NULL)
}
\arguments{
  \item{x}{
    Numeric vector of positive shape parameters, \eqn{\alpha}.
    If omitted, uses \code{c(0.1, 0.5, 1, 5, 20)}.
  }
  \item{file}{
    Output PNG filename, or \code{NULL} to use the current graphics device.
  }
  \item{col}{
    Colours for the curves. If omitted, uses
    \code{grDevices::rainbow(length(x))}, with the default shape
    parameters used when \code{x} is omitted.
  }
  \item{...}{
    Additional arguments passed to plotting functions.
    Arguments must be compatible with the functions receiving them
    and must not duplicate arguments supplied internally.
  }
}
\details{
For each shape parameter \eqn{\alpha}, the scale parameter is set to
\eqn{1/\alpha}, giving a distribution with mean one.
Densities are evaluated over substitution rates from zero to two.

When \code{file} is supplied, the function creates a PNG measuring
1200 by 800 pixels at 150 pixels per inch.
}
\value{
Used for its side effect of drawing a plot or writing a PNG file.
}
\references{
Yang, Z. (1996).
Among-site rate variation and its impact on phylogenetic analyses.
Trends in Ecology \& Evolution, 11, 367--372.
}
\examples{
plotYangGamma()

plotYangGamma(
  c(0.1, 0.5, 1),
  col = c("black", "blue", "red"),
  lwd = 2
)

outfile <- tempfile(fileext = ".png")
plotYangGamma(file = outfile)
unlink(outfile)
}
\keyword{hplot}
