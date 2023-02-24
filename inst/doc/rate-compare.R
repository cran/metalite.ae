## ---- include=FALSE-----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE
)

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(metalite.ae)

## -----------------------------------------------------------------------------
ana <- data.frame(
  treatment = c(rep(0, 100), rep(1, 100)),
  response  = c(rep(0, 80), rep(1, 20), rep(0, 40), rep(1, 60)),
  stratum   = c(rep(1:4, 12), 1, 3, 3, 1, rep(1:4, 12), rep(1:4, 25))
)

head(ana)

## -----------------------------------------------------------------------------
rate_compare(response ~ treatment, data = ana)

## -----------------------------------------------------------------------------
rate_compare(
  formula = response ~ treatment, strata = stratum, data = ana,
  weight = "ss"
)

