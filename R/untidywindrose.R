#' launches the untidywindrose shiny app
#' 
#' @title untidywindrose
#' @description starts the untidywindrose shiny app
#' @importFrom shiny runApp
#' @return shiny application object
#' @export
untidywindrose <- function() {
  utwr.path <- system.file(package = "untidywindrose")
  shiny::runApp(appDir = utwr.path)
  
  #not used, removed
  #@importFrom rprojroot find_package_root_file
}
