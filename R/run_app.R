
#' Run the Australian Bushfire Weather Risk Explorer
#'
#' Launches the Shiny application included in this package.
#'
#' @param ... Additional arguments passed to shiny::runApp().
#'
#' @return Launches a Shiny application.
#' @export
run_app <- function(...) {
  
  app_dir <- system.file(
    "shiny-app",
    package = "bushfireexplorer"
  )
  
  if (app_dir == "") {
    stop(
      "Shiny app files were not found. Please reinstall the package.",
      call. = FALSE
    )
  }
  
  shiny::runApp(app_dir, ...)
}
