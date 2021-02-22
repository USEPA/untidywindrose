#' launches the untidywindrose shiny app
#' 
#' @title utwr
#' @description starts the untidywindrose shiny app
#' @importFrom shiny runApp
#' @importFrom magrittr `%>%`
#' @importFrom rprojroot find_root_file
#' @return shiny application object
#' @export
utwr <- function() {
  rprojroot::find_root_file("R",
                            "app.R",
                            criterion = has_file("DESCRIPTION")
                            ) %>% 
  shiny::runApp()
}
