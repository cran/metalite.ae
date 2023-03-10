# Copyright (c) 2023 Merck & Co., Inc., Rahway, NJ, USA and its affiliates.
# All rights reserved.
#
# This file is part of the metalite.ae program.
#
# metalite.ae is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#' Prepare datasets for AE specific analysis
#'
#' @inheritParams prepare_ae_specific
#' @param subgroup_var A character value of subgroup variable name in
#'   observation data saved in `meta$data_observation`.
#' @param subgroup_header An integer value of column header for subgroup.
#' @param display_total test
#' @param display_subgroup_total test
#'
#' @return A list of analysis raw datasets.
#'
#' @export
#'
#' @examples
#' meta <- meta_ae_example()
#'
#' prepare_ae_specific_subgroup(
#'   meta,
#'   population = "apat",
#'   observation = "wk12",
#'   parameter = "rel",
#'   subgroup_var = "RACE"
#' )
prepare_ae_specific_subgroup <- function(meta,
                                         population,
                                         observation,
                                         parameter,
                                         subgroup_var,
                                         subgroup_header = 1,
                                         components = c("soc", "par"),
                                         display_total = TRUE,
                                         display_subgroup_total = TRUE) {
  message("This function is still under development.")
  return(invisible(NULL))

  if (!subgroup_header %in% c(1, 2)) {
    stop("`subgroup_header` can only have value 1 or 2.", call. = FALSE)
  }

  display <- c("n", "prop")
  if (display_total) display <- c(display, "total")

  meta_original <- meta

  meta$data_observation <- collect_observation_record(meta,
    population = population,
    observation = observation,
    parameter = parameter,
    var = names(meta$data_observation)
  )

  # Obtain variables
  par_var <- collect_adam_mapping(meta, parameter)$var
  par_soc <- collect_adam_mapping(meta, parameter)$soc

  # Convert variable to factor
  meta$data_observation[[par_var]] <- factor(as.character(meta$data_observation[[par_var]]),
    levels = sort(unique(meta$data_observation[[par_var]]))
  )

  meta$data_observation[[par_soc]] <- factor(as.character(meta$data_observation[[par_soc]]),
    levels = sort(unique(meta$data_observation[[par_soc]]))
  )

  meta_subgroup <- metalite::meta_split(meta, subgroup_var)

  outdata_all <- prepare_ae_specific(meta,
    population = population,
    observation = observation,
    parameter = parameter,
    components = components
  )

  outdata_subgroup <- lapply(meta_subgroup,
    prepare_ae_specific,
    population = population,
    observation = observation,
    parameter = parameter,
    components = components,
    display = display
  )

  # Update variable name
  for (i in seq_along(outdata_subgroup)) {
    names(outdata_subgroup[[i]]$data)[-1] <- paste0(names(outdata_subgroup[[i]]$data)[-1], "_", letters[i])
    names(outdata_subgroup[[i]]$n) <- paste0(names(outdata_subgroup[[i]]$n), "_", letters[i])
    names(outdata_subgroup[[i]]$prop) <- paste0(names(outdata_subgroup[[i]]$prop), "_", letters[i])
  }

  # Combine data
  data <- outdata_subgroup[[1]]$data
  n <- outdata_subgroup[[1]]$n
  prop <- outdata_subgroup[[1]]$prop

  for (i in 2:length(outdata_subgroup)) {
    data <- data.frame(data, outdata_subgroup[[i]]$data[, -1])
    n <- data.frame(n, outdata_subgroup[[i]]$n)
    prop <- data.frame(prop, outdata_subgroup[[i]]$prop)
  }

  if (subgroup_header == 2) {
    x <- names(data)
    x[1] <- "a"
    x <- gsub("prop", "n", x)
    data <- data[, order(x)]
    n <- n[, order(names(n))]
    prop <- prop[, order(names(prop))]
  }

  outdata <- list(
    data = data,
    order = outdata_all[[1]]$order,
    n = n,
    prop = prop,
    components = outdata_subgroup[[1]]$components,
    group = outdata_subgroup[[1]]$group,
    subgroup = tools::toTitleCase(tolower(names(outdata_subgroup))),
    display_total = display_total,
    display_subgroup_total = display_subgroup_total,
    meta = meta_original,
    population = population,
    observation = observation,
    parameter = parameter
  )

  outdata
}
