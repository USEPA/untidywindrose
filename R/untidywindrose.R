#' launches the untidywindrose shiny app
#' 
#' @title untidywindrose
#' @description starts the untidywindrose shiny app
#' @import shiny
#' @return shiny application object
#' @export
untidywindrose <- function() {
  shiny::runApp("./R/App.R")
}
