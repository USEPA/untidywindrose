wbcolnames <- NA
wr <- NA
outputextnsions <- list("png", "bmp", "jpeg", "tiff", "eps", "pdf", "ps")


#' @title ui for untidywindrose.
#' @description The Rshiny's UI object for untidywindrose
#' @importFrom DT dataTableOutput
#' @importFrom shiny mainPanel titlePanel tags fileInput numericInput
#' @importFrom shiny selectInput radioButtons actionButton downloadButton
#' @importFrom shiny plotOutput sidebarPanel fluidPage
#' @importFrom shinyjs useShinyjs hidden
#' @importFrom openair windRose
#' @return NA
   ui <- shiny::fluidPage(shiny::titlePanel(title = "untidywindrose",
                                            windowTitle = "untidywindrose"),
                
                shiny::mainPanel(
                  shinyjs::useShinyjs(),
                  shiny::tags$p(),
                  "For questions, comments or bug reports",
                  shiny::tags$a(href = "mailto:mccrowey.clinton@epa.gov?subject=Rshiny untidywindrose app",
                         "E-mail the author"),
                  shiny::tags$p(),
                
                  shiny::fileInput(inputId = "inputfile",
                            label = "Select a file"),
                  shiny::numericInput(inputId = "headerrows",
                               label = "Ignore first N rows",
                               value = 0,
                               min = 0),
                  shiny::selectInput(inputId = "header",
                              label = "Does this file contain a header?",
                              choices = list(F,T)
                              ),
                  shiny::selectInput(inputId = "transpose",
                              label = "Transpose the data?",
                              choices = list(F,T)
                              ),
                  shiny::radioButtons(inputId = "delim",
                               label = "File delimiter",
                               choices = list("tab (\"/t\")",
                                              "comma (\",\")",
                                              "semicolon (\";\")",
                                              "bar (\"|\")",
                                              "space (\" \")",
                                              "other delimter"
                                              ), 
                              selected = NULL
                              ),
                  shinyjs::hidden(shiny::textInput(inputId = "delimother",
                                   label = "delimiter"
                                  )
                         ),
                  shiny::actionButton(inputId = "submit",
                               label = "Submit"
                               ),
                  shinyjs::hidden(shiny::selectInput(inputId = "windspeed",
                                     label = "which column represents windspeed?",
                                     choices = wbcolnames)
                         ),
                  shinyjs::hidden(shiny::selectInput(inputId = "winddirection",
                              label = "which column represents wind direction?",
                                     choices = wbcolnames)
                        ),
                  shinyjs::hidden(shiny::selectInput(inputId = "outputext",
                                     label = "plot output extension?",
                                     choices = outputextnsions)
                                    ),
                  shinyjs::hidden(shiny::actionButton(inputId = "submit2",
                                      label = "Display Plot")
                         ),
                  shinyjs::hidden(shiny::downloadButton(outputId = "outfile",
                                        label = "Download Plot")
                        ),
                  width = 3
                  ),


                  shiny::sidebarPanel(DT::dataTableOutput(outputId = "outputtable"),
                               shiny::plotOutput(outputId = "wr"),
                               width = 9
                               )
                  )


#' @title server for untidywindrose.
#' @description The Rshiny's server object for untidywindrose
#' @param input the required rshiny input object
#' @param output the required rshiny output object
#' @param session the optional rshiny session object
#' @importFrom openair windRose
#' @return NA
#' @noRd

server <- function(input, output, session){
              worksheet <- reactiveValues()
              observeEvent(input$submit,{
                shinyjs::show("windspeed")
                shinyjs::show("winddirection")
                shinyjs::show("outputext")
                delim <- input$delim
                output$outputtable <- renderDataTable({
                infile <- input$inputfile
                switch(delim,
                      "tab (\"/t\")" = delim <- "\t",
                      "semicolon" = delim <- ";",
                      "comma (\",\")" = delim <- ",",
                      "semicolon (\";\")" = delim <- ";",
                      "bar (\"|\")" = delim <- "|",
                      "space (\" \")" = delim <- "",
                      "other delimter" = delim <- delim <- isolate(input$delimother),
                      warning("Invalid delim selected")
                     )
                worksheet$wb <- isolate(read.delim(infile$datapath,
                                                   header = as.logical(input$header),
                                                   sep = delim, skip = input$headerrows
                                                   )
                                        )
                if (input$transpose == T)
                  {
                    worksheet$wb <- t(isolate(worksheet$wb))
                  }
                wbcolnames <- colnames(worksheet$wb)
                updateSelectInput(session = session,
                                  inputId = "windspeed",
                                  label = "which column represents windspeed?",
                                  choices = wbcolnames
                                  )
                updateSelectInput(session = session,
                                  inputId = "winddirection",
                                  label = "which column represents wind direction?",
                                  choices = wbcolnames
                                  )
                shinyjs::show("submit2")
                return(worksheet$wb)
                })
              })
              
              observeEvent(input$delim,{
              if (isolate(input$delim) == "other delimter") {
                    shinyjs::show("delimother") }
                    else {shinyjs::hide("delimother")}
              })
  
              observeEvent(input$submit2, {
                output$wr <- renderPlot({windRose(mydata = worksheet$wb,
                                                  ws = isolate(input$windspeed),
                                                  wd = isolate(input$winddirection),
                                                  annotate = T)
                                        })
                output$outfile <- downloadHandler(
                  filename = function() {
                    if (isolate(input$outputext) == "png") { ext <- ".png"}
                    else if (isolate(input$outputext) == "bmp") {ext <- ".bmp"}
                    else if (isolate(input$outputext) == "jpeg") {ext <- ".jpeg"}
                    else if (isolate(input$outputext) == "tiff") {ext <- ".tiff"}
                    else if (isolate(input$outputext) == "eps") {ext <- ".eps"}
                    else if (isolate(input$outputext) == "pdf") {ext <- ".pdf"}
                    else if (isolate(input$outputext) == "ps") {ext <- ".ps"}
                    
                    return(paste0("windrose_",
                                  format(Sys.time(),
                                         format = "%m-%d-%Y_%H_%M"),
                                  ext)
                           )
                                         },

                content = function(file) {
                    if (isolate(input$outputext) == "png") { png(file)}
                    else if (isolate(input$outputext) == "bmp") {bmp(file)}
                    else if (isolate(input$outputext) == "jpeg") {jpeg(file)}
                    else if (isolate(input$outputext) == "tiff") {tiff(file)}
                    else if (isolate(input$outputext) == "eps") {
                                                                  setEPS()
                                                                  postscript(file)
                                                                }
                    else if (isolate(input$outputext) == "pdf") { pdf(file) }
                    else if (isolate(input$outputext) == "ps") {postscript(file)}
                    plot(windRose(mydata = worksheet$wb,
                                  ws = isolate(input$windspeed),
                                  wd = isolate(input$winddirection),
                                  annotate = T)
                         )
                    dev.off()
                    }
                )
  })
  
  observeEvent(input$submit2,{shinyjs::show("outfile") })
}

#' @title shinyApp call for untidywindrose.
#' @description the call to shinyApp for untidywindrose
#' @importFrom shiny shinyApp
#' @param ui the required rshiny input object for untidywindrose
#' @param server the required rshiny input object for untidywindrose
#' @return NA
#' @noRd
shiny::shinyApp(ui = ui, server = server)
