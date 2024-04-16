## -----------------------------------------------------------------------------
library(metalite.ae)

## ----message = FALSE----------------------------------------------------------
meta <- meta_ae_example()

x <- meta |>
  prepare_ae_summary(
    population = "apat",
    observation = "wk12",
    parameter = "any;rel;ser",
  ) |>
  extend_ae_summary_eaer(
    duration_var = "TRTDUR",
    adj_unit = "month"
  )

x

## -----------------------------------------------------------------------------
x$eaer

