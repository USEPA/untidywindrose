#' launches the untidywindrose shiny app
#' 
#' @title utwr
#' @description starts the untidywindrose shiny app
#' @import shiny
#' @return shiny application object
#' @export
utwr <- function() {
  shiny::runApp("./R/App.R")
}
