## ----setup, include = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE------------------------------------------------------
print(getwd())
#sampledata <- read.table("vignettes/sampledata.txt", header = T, sep = "\t")
#knitr::kable(sampledata, caption = "Sample windrose data")

## ----echo=FALSE, fig.width=5, fig.align = "center", message=F, warning=F----
require(openair)
cbPalette <- c("#999999", "#E69F00", "#56B4E9",  #colorbild safer pallette
                "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# openair::windRose(sampledata,
#                   ws = "Windspeed",
#                   auto.text = T,
#                   wd = "WindDirection",
#                   cols = cbPalette,
#                   paddle = T,
#                   statistic = "prop.count",
#                   annotate  = T,
#                   key.position = "right",
#                   #breaks = c(0.5, 3, 10, 15),
#                   #ws.int = 5,
#                   key.footer = "mi/hr")

