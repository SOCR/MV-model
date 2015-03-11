# UI for Sidebar
library(lubridate)

#UI output for sidebar panel 1- Portfolio settings
output$ticker <- renderUI({
  div(class="span8",textInput("ticker", label = h4("Ticker Symbol"), value = "AAPL HSY"))
})

output$start_date <- renderUI({
  div(class="span8", textInput(inputId="start_date", label = "Start Date:", value = "2010-01-01"), selected="2010-01-01", width="100%")
})

output$end_date <- renderUI({
  div(class="span8", textInput(inputId="end_date", label = "End Date:", value = "2014-01-01"), selected="2014-01-01", width="100%")
})

output$predict_date <- renderUI({
  div(class="span8", textInput(inputId="predict_date", label = "Prediction to Date:", value = Sys.Date()+years(1)), selected=Sys.Date()+years(1), width="100%")
})

output$total_money <- renderUI({
  div(class="span8", textInput(inputId="Total Money", label = "Total Money to Invest", value ="1,000,000"))
})

#run model
output$run_model<- renderUI({
  div(class="span8",actionButton("run_model", label = "Run the Model",width=18))
})

#download button
output$user_report <- renderUI({
  if(!is.null(input$run_model)){
    if(input$run_model!=0)
      downloadButton(outputId="user_report", label = "Download Full Report", class = NULL)
  }
})


#UI output for Sidebar panel 2- MV model options

output$include_options<-renderUI({
  
  checkboxInput("include_options",h5("Allow Use of Options"))
  
})

output$include_fixed_income<-renderUI({
  
  checkboxInput("include_fixed_income",h5("Allow Use of Fixed Income"))
                
})


