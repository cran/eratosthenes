## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eratosthenes)
require(Rcpp)

## -----------------------------------------------------------------------------
x <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
y <- c("B", "D", "G", "H", "K")
z <- c("F", "K", "L", "M")
contexts <- list(x, y, z)

seq_check(contexts) # check if the sequences are in agreement

## -----------------------------------------------------------------------------
f1 <- list(id = "find01", assoc = "D", type = c("type1", "form1"))
f2 <- list(id = "find02", assoc = "E", type = c("type1", "form2"))
f3 <- list(id = "find03", assoc = "G", type = c("type1", "form1"))
f4 <- list(id = "find04", assoc = "H", type = c("type2", "form1"))
f5 <- list(id = "find05", assoc = "I", type = "type2")
f6 <- list(id = "find06", assoc = "H", type = NULL)
artifacts <- list(f1, f2, f3, f4, f5, f6)

## -----------------------------------------------------------------------------
# external
coin1 <- list(id = "coin1", assoc = "B", type = NULL, samples = runif(100,-320,-300))
coin2 <- list(id = "coin2", assoc = "G", type = NULL, samples = runif(100,37,41))
destr <- list(id = "destr", assoc = "J", type = NULL, samples = 79)

tpq_info <- list(coin1, coin2)
taq_info <- list(destr)

## -----------------------------------------------------------------------------
dates <- gibbs_ad(contexts, finds = artifacts, samples = 10^4, tpq = tpq_info, taq = taq_info)

## -----------------------------------------------------------------------------
str(dates)

