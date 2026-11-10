"plotYangGamma" <- function(x, file = NULL, col = NULL, ..., ylim = NULL) {
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

    if (is.null(ylim)) {
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
    } else {
        Ylim <- ylim
    }

    if (!is.null(file)) {
        png(file = file, width = 1200, height = 800, res = 150)
    }

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

