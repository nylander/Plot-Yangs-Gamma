"plotYangGamma" <- function(x, file = NULL, col = NULL, ...) {

    # Generate a png plot of the Gamma distribution with different alpha values.
    # Similar to Fig. 1 in Yang, Z. TREE, 11:367--372, 1996.
    # Last modified: ons jun 03, 2020  10:59
    # johan.nylander\@{nrm|nbis}.se

    # From Hillis et al., 1996. Mol. Systematics, p. 443:
    # "The Gamma distribution has two parameters,
    # a shape parameter alpha, and a scale parameter beta.
    # By setting beta to 1/alpha, a distribution with mean 1 is obtained."

    # Usage:
    #  plotYangGamma(x, file, col, ...)

    # Arguments:
    #  x: vector of alpha values. Default is c(0.1, 0.5, 1.0, 5.0, 20.0)
    #  file: Output filename (PNG)
    #  col: vector of colors to use. Default is rainbow(length(alphas)).
    #  ...: Arguments to be passed to methods, such as graphical parameters
    
    if (missing(x)) {
        alphas <- c(0.1, 0.5, 1.0, 5.0, 20.0)
    } else {
        alphas <- x
    }
    
    if (missing(col)) {
        cols <- rainbow(length(alphas))
    } else {
        cols <- col
    }

    s <- seq(0, 2, 0.01)

    # find ylim
    arguments <- list(...)
    if ("ylim" %in% (names(arguments))) {
        myYlim <- FALSE
        Ylim <- as.vector(arguments["ylim"])
    } else {
        myYlim <- TRUE
    }

    if (myYlim) {
        m <- vector()
        for (i in 1:length(alphas)) {
            a <- alphas[i]
            b <- 1/a
            asort <- sort(dgamma(s, shape = a, scale = b), decreasing = TRUE)
            if (asort[1] == Inf) {
                amax <- asort[2]
            }
            else {
                amax <- asort[1]
            }
            m[i] <- amax
        }
        Ylim <- c(0, max(m))
    }

    if (!is.null(file)) {
        png(file = file, width = 1200, height = 800, res = 150)
    }

    # plot the first value
    a <- alphas[1]
    b <- 1/a
    plot(s,
         dgamma(s, shape = a, scale = b),
         type = "l",
         col = cols[1],
         ylim = Ylim,
         xlab = "Substitution rate (r)",
         yaxt = "no",
         ylab = "Proportion of sites f(r)",
         cex.lab = 1.2,
         cex.main = 2,
         main = expression(paste(Gamma, "(", alpha, ",", beta, "=1/", alpha, ")", " distribution")),
         ...)

    # add the rest
    if ( is.na(alphas[2]) ) {
        if (!is.null(file)) {
            legend(x = "topright", legend = alphas, col = cols, lty = 1, bty = "n", ...)
            dev.off() 
        }
        else {
            legend(x = "topright", legend = alphas, col = cols, lty = 1, bty = "n", ...)
        }
    }
    else {
        for (i in 2:length(alphas)) {
            a <- alphas[i]
            b <- 1/a;
            lines(s, dgamma(s, shape = a, scale = b), type = "l", col = cols[i], ylim = Ylim, ...)
        }
        if (!is.null(file)) {
            legend(x = "topright", legend = alphas, col = cols, lty = 1, bty = "n", ...)
            dev.off() 
        }
        else {
            legend(x = "topright", legend = alphas, col = cols, lty = 1, bty = "n", ...)
        }
    }
}

