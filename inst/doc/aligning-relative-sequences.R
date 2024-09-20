## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eratosthenes)

## -----------------------------------------------------------------------------
x <- c("A", "B", "C", "D", "E")
y <- c("B", "D", "F", "E")
a <- list(x, y)
seq_check(a)

## -----------------------------------------------------------------------------
z <- c("B", "F", "C")
b <- list(x, y, z)
seq_check(b)

## -----------------------------------------------------------------------------
x <- c("A", "B", "C", "D", "H", "E")
y <- c("B", "D", "F", "G", "E")
a <- list(x, y)
synth_rank(a)

## -----------------------------------------------------------------------------
# input
seriated <- c("S1", "T1", "T2", "S3", "S4", "T4", "T5", "T6", "S5", "T7", "S2")
# target
stratigraphic <- c("S1", "S2", "S3", "S4", "S5")
# input adjusted to agree with the target
seq_adj(seriated, stratigraphic)

## ----echo = FALSE, fig.dim = c(12, 10), out.width = "100%", fig.align = 'center'----
u <- unique(c(seriated, stratigraphic))

x <- match(u, seriated)
y <- match(u, stratigraphic)

input <- x[!is.na(y)]
target <- y[!is.na(y)]

interp <- approx(input, target, n = length(x) )

plot(interp, xlab = "input (seriated)", ylab = "target (stratigraphic)", type = "l")
points(interp, pch = 16)
for (i in 1:length(x)) {
  arrows(x0 = interp$x[i], y0 = interp$y[i], x1 = 0.8, y1 = interp$y[i], length = 0.1, angle = 20  )
  text(interp$x[i], interp$y[i], seriated[i], pos = 4, offset = 0.3)
}

## -----------------------------------------------------------------------------
x <- c("A", "B", "C", "D", "H", "E")
y <- c("B", "D", "F", "G", "E")
a <- list(x, y)
quae_postea(a)
quae_antea(a)

