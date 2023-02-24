## ---- include=FALSE-----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  out.width = "100%",
  dpi = 150
)

## -----------------------------------------------------------------------------
library(metalite.ae)
library(metalite)

## ---- out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0listing0ser0wk12.pdf")

## -----------------------------------------------------------------------------
meta <- meta_ae_example()
meta

## -----------------------------------------------------------------------------
tbl <- prepare_ae_listing(
  meta,
  analysis = "ae_listing",
  population = "apat",
  observation = "wk12",
  parameter = "ser"
)
head(tbl$tbl)
head(tbl$col_name)

## -----------------------------------------------------------------------------
footnote <- c(
  "Related: Investigator-assessed relationship of the adverse event to study medication. Y = RELATED, N = NOT RELATED",
  "Action Taken: Discontinued = DRUG WITHDRAWN, Interrupted = DRUG INTERRUPTED, Reduced = DOSE REDUCED, Increased = DOSE INCREASED, None = DOSE NOT CHANGED, N/A = NOT APPLICABLE.",
  "Outcome: Resolved = RECOVERED/RESOLVED, Resolving = RECOVERING/RESOLVING, Sequelae = RECOVERED/RESOLVED WITH SEQUELAE, Not resolved = NOT RECOVERED/NOT RESOLVED.",
  "Adverse event terms are from MedDRA Version 25.0."
)

## -----------------------------------------------------------------------------
tbl |> tlf_ae_listing(
  footnotes = footnote,
  orientation = "portrait",
  source = "Source:  [CDISCpilot: adam-adsl; adae]",
  path_outtable = "rtf/ae0listing0ser0wk12.rtf",
  path_outdata = NULL
)

## ---- out.width = "100%", out.height = "400px", echo = FALSE, fig.align = "center"----
knitr::include_graphics("pdf/ae0listing0ser0wk12.pdf")

