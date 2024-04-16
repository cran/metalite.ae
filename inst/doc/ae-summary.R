## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  out.width = "100%",
  dpi = 150
)

## -----------------------------------------------------------------------------
library(metalite.ae)

## ----out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0summary1.pdf")

## -----------------------------------------------------------------------------
meta <- meta_ae_example()

## -----------------------------------------------------------------------------
meta

## ----message=FALSE------------------------------------------------------------
outdata <- prepare_ae_summary(
  meta,
  population = "apat",
  observation = "wk12",
  parameter = "any;rel;ser"
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
tbl <- outdata |> format_ae_summary()
tbl$tbl

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_summary(display = c("n", "prop", "diff"))
tbl$tbl

## -----------------------------------------------------------------------------
tbl <- outdata |>
  extend_ae_specific_inference() |>
  format_ae_summary(display = c("n", "prop", "diff", "diff_ci"))

tbl$tbl

## -----------------------------------------------------------------------------
tbl <- outdata |> format_ae_summary(mock = TRUE)
tbl$tbl

## -----------------------------------------------------------------------------
outdata |>
  format_ae_summary() |>
  tlf_ae_summary(
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    path_outtable = "rtf/ae0summary1.rtf"
  )

## ----out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0summary1.pdf")

## -----------------------------------------------------------------------------
outdata |>
  format_ae_summary() |>
  tlf_ae_summary(
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    col_rel_width = c(6, rep(1, 8)),
    text_font_size = 8,
    orientation = "landscape",
    path_outtable = "rtf/ae0summary2.rtf"
  )

## ----out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0summary2.pdf")

## -----------------------------------------------------------------------------
outdata |>
  format_ae_summary(mock = TRUE) |>
  tlf_ae_summary(
    source = "Source:  [CDISCpilot: adam-adsl; adae]",
    path_outtable = "rtf/mock_ae0summary1.rtf"
  )

## ----out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/mock_ae0summary1.pdf")

