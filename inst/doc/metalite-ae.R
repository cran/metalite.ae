## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  out.width = "100%",
  dpi = 150,
  eval = TRUE
)

## ----include=FALSE------------------------------------------------------------
library(metalite.ae)

## ----eval = FALSE-------------------------------------------------------------
#  meta_ae_example() |> # Example AE data created using metalite
#    prepare_ae_summary(
#      population = "apat", # Select population by keywords
#      observation = "wk12", # Select observation by keywords
#      parameter = "any;rel;ser" # Select AE terms by keywords
#    ) |>
#    format_ae_summary() |>
#    tlf_ae_summary(
#      source = "Source:  [CDISCpilot: adam-adsl; adae]", # Define data source
#      path_outtable = "ae0summary.rtf" # Define output
#    )

## ----out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0summary1.pdf")

