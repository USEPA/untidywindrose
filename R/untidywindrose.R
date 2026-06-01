#' launches the untidywindrose shiny app
#' 
#' @title untidywindrose
#' @description starts the untidywindrose shiny app
#' @importFrom utils installed.packages
#' @importFrom shiny runApp
#' @importFrom pak pkg_install
#' @return shiny application object
#' @export
untidywindrose <- function() {
  if ("untidywindrose" %in% installed.packages())
  {
    #donoting
  } else {
    pak::pkg_install(".")
  }
  
  utwr.path <- system.file(package = "untidywindrose")
  shiny::runApp(appDir = utwr.path)
}
