#devtools::install_github("rstudio/shiny-incubator", ref = "0f343efe9b6c255e6687aaa52b5443cf975f96e7")

library(shinyIncubator)
shinyUI(fluidPage(
  progressInit(),
  titlePanel("Christian Gao Mean Variance Portfolio Optimization",windowTitle="Gao's Portfolio Optimization"),
  fluidRow(
    source("external/sidebar/sidebar.R",local=T)$value,
    source("external/forMainDisplay/main_display_ui.R",local=T)$value
  )
  
)
)


