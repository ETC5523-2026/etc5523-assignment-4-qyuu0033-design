
#' Summarise Australian Bushfire Weather Risk
#'
#' Filters bushfire risk findings by indicator and climate scenario.
#'
#' @param data A data frame containing bushfire risk findings.
#' @param selected_indicator Optional indicator to select.
#' @param selected_scenario Optional climate scenario to select.
#'
#' @return A filtered data frame containing the selected findings.
#'
#' @examples
#' summarise_risk(
#'   bushfire_risk,
#'   selected_indicator = "Extreme fire weather",
#'   selected_scenario = "Present climate"
#' )
#'
#' @export
summarise_risk <- function(data,
                           selected_indicator = NULL,
                           selected_scenario = NULL) {
  
  result <- data
  
  if (!is.null(selected_indicator)) {
    result <- result[
      result$indicator == selected_indicator,
      ,
      drop = FALSE
    ]
  }
  
  if (!is.null(selected_scenario)) {
    result <- result[
      result$scenario == selected_scenario,
      ,
      drop = FALSE
    ]
  }
  
  result
}
