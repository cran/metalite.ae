## ---- include=FALSE-----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  out.width = "100%",
  dpi = 150
)

## -----------------------------------------------------------------------------
library(metalite)
library(metalite.ae)

## ---- out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("rtf/ae0specific1.rtf")

## -----------------------------------------------------------------------------
meta <- meta_ae_example()
meta

## ---- message = FALSE---------------------------------------------------------
outdata <- prepare_ae_specific(
  meta,
  population = "apat",
  observation = "wk12",
  parameter = "rel"
)

## -----------------------------------------------------------------------------
outdata

## -----------------------------------------------------------------------------
outdata$group

## -----------------------------------------------------------------------------
head(data.frame(outdata$order, outdata$name))

## -----------------------------------------------------------------------------
outdata$n_pop

## -----------------------------------------------------------------------------
head(outdata$n)

## -----------------------------------------------------------------------------
head(outdata$prop)

## -----------------------------------------------------------------------------
head(outdata$diff)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific()
head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific(display = c("n", "prop", "diff"))
head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |>
  extend_ae_specific_inference() |>
  format_ae_specific(display = c("n", "prop", "diff", "diff_ci"))
head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |>
  extend_ae_specific_duration(duration_var = "ADURN") |>
  format_ae_specific(display = c("n", "prop", "dur"))

head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |>
  extend_ae_specific_events() |>
  format_ae_specific(display = c("n", "prop", "events"))

head(tbl$tbl)

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_specific(mock = TRUE)
head(tbl$tbl)

## -----------------------------------------------------------------------------
outdata |>
  format_ae_specific() |>
  tlf_ae_specific(
    meddra_version = "24.0",
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    path_outtable = "rtf/ae0specific1.rtf"
  )

## ---- out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0specific1.pdf")

## -----------------------------------------------------------------------------
outdata |>
  format_ae_specific() |>
  tlf_ae_specific(
    meddra_version = "24.0",
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    col_rel_width = c(6, rep(1, 8)),
    text_font_size = 8,
    orientation = "landscape",
    path_outtable = "rtf/ae0specific2.rtf"
  )

## ---- out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0specific2.pdf")

## -----------------------------------------------------------------------------
outdata |>
  format_ae_specific(mock = TRUE) |>
  tlf_ae_specific(
    meddra_version = "24.0",
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    path_outtable = "rtf/mock_ae0specific1.rtf"
  )

## ---- out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/mock_ae0specific1.pdf")

