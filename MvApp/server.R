library(shiny)
library(shinyIncubator)
#library(shinyapps)
#shinyapps::setAccountInfo(name='consultgao', token='02EAA878757839769B08700D9A66F4F6', secret='AGI92mrLcdoBqsmR8GmOiZ0y91gHq5RKbgHZE9Yp')
#devtools::install_github('rstudio/shinyapps')
#deployApp()

shinyServer(function(input, output, session){
  
  source("external/sidebar/io.sidebar.wp1.R",local=T)
  source("external/forMainDisplay/main_display.R",local=T)
  
})