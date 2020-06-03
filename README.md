# Plot Yang's Gamma

- Version: 08/29/2014 03:42:15 PM
- By: Johan.Nylander\@{nrm|nbis}.se


## Description

Generate a png plot of the Gamma distribution with different alpha values
(similar to Fig. 1 in Yang, Z. TREE, 11:367--372, 1996).


## Background

One of the more signiciant contributions to the field of computational
phylogenetics is arguably the introduction of using a Gamma distribution
to model rate variation across sites (alignment columns).

This was proposed by Ziheng Yang in the beginning of the 1990's, and
we have all seen examples of the Gamma distribution when changing
the parameters of the distribution.

From Hillis et al., 1996, p. 443:

>"The Gamma distribution has two parameters,
>a shape parameter alpha, and a scale parameter beta.
>By setting beta to 1/alpha, a distribution with mean 1 is obtained."

Unfortunately, we many times had to watch (or even use ourselves!) the 
original Fig. 1 from Yang's 1996 paper, scanned and pasted in to some
MS Power Point presentation...

![Fig.1, Yang 1996, scanned and pasted in a presentation](img/Gamma_distribution_Yang.png?raw=true "Fig.1 Yang 1996")

But then came [R](https://www.r-project.org/), and fortunately, things
were made simple!

![Plot in R using plotYangGamma()](img/ga.png?raw=true "Plot in R using plotYangGamma")


## Usage:

Start [R](https://www.r-project.org/), and then

    > source("plotYangGamma.R")
    > plotYangGamma()

or perhaps

    > alphas <- c(0.1, 0.5, 1.0)
    > cols <- c("black", "blue", "red")
    > plotYangGamma(alphas, lwd = 6, col = cols, file = "Yangs-Gamma.png")


## References:

- Hillis, D., et al.. 1996. Molecular Systematics, 2nd Ed. Sinauer Associates.
- Yang, Z. 1996. Among-site rate variation and its impact on phylogenetic analyses. TREE, 11:367-372.

