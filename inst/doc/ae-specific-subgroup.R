## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  out.width = "100%",
  dpi = 150
)

## -----------------------------------------------------------------------------
library(metalite.ae)

## -----------------------------------------------------------------------------
meta <- meta_ae_example()

## -----------------------------------------------------------------------------
outdata <- prepare_ae_specific_subgroup(
  meta,
  population = "apat",
  observation = "wk12",
  parameter = "rel",
  subgroup_var = "SEX",
  subgroup_header = c("TRTA", "SEX"),
  display_subgroup_total = TRUE
)

## -----------------------------------------------------------------------------
outdata

## -----------------------------------------------------------------------------
outdata$out_all$F
outdata$out_all$M
outdata$out_all$Total

## -----------------------------------------------------------------------------
outdata$group
outdata$subgroup

## -----------------------------------------------------------------------------
head(data.frame(outdata$out_all$Total$order, outdata$out_all$Total$name))

## -----------------------------------------------------------------------------
outdata$out_all$F$n_pop
outdata$out_all$M$n_pop
outdata$out_all$Total$n_pop

## -----------------------------------------------------------------------------
head(outdata$out_all$F$n)
head(outdata$out_all$M$n)
head(outdata$out_all$Total$n)

## -----------------------------------------------------------------------------
head(outdata$out_all$F$prop)
head(outdata$out_all$M$prop)
head(outdata$out_all$Total$prop)

## -----------------------------------------------------------------------------
head(outdata$out_all$Total$diff)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific_subgroup()
head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific_subgroup(display = c("n", "prop"))
head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific_subgroup(display = c("n", "prop", "diff"))
head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific_subgroup(mock = FALSE)
head(tbl$tbl)

## -----------------------------------------------------------------------------
outdata |>
  format_ae_specific_subgroup() |>
  tlf_ae_specific_subgroup(
    meddra_version = "24.0",
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    path_outtable = "rtf/ae0specific0sub0gender1.rtf"
  )

## ----out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0specific0sub0gender1.pdf")

