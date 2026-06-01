#' launches the untidywindrose shiny app
#' 
#' @title untidywindrose
#' @description starts the untidywindrose shiny app
#' @importFrom shiny runApp
#' @return shiny application object
#' @export
untidywindrose <- function() {
<<<<<<< HEAD
  utwr.path <- system.file(package = "untidywindrose")
  shiny::runApp(appDir = utwr.path)
  
  #not used, removed
  #@importFrom rprojroot find_package_root_file
=======
  options(shiny.autoload.r=FALSE)
  utwr.path <- system.file(package = "untidywindrose")
  shiny::runApp(appDir = utwr.path)
>>>>>>> 62dab13 (update DESCRIPTION to require newer R version, generte updated manifest.json)
}
