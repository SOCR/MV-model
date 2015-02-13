# UI for Sidebar
library(lubridate)

#UI output for sidebar panel 1- Portfolio settings
output$ticker <- renderUI({
  div(class="span8",textInput("ticker", label = h4("Ticker Symbol"), value = "AAPL HSY"))
})

output$add_ticker<- renderUI({
  div(class="span8",actionButton("add_ticker", label = "Add Ticker",width=25))
})

output$clear_portfolio<- renderUI({
  div(class="span8",actionButton("clear_portfolio", label = "Clear Portfolio",width=25))
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

#action button
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

#current list of stocks
output$stock_list <- renderText({ 
  input$add_ticker
  #counter
  
  if(input$add_ticker==0)
    i<<-0
  
  if(input$add_ticker==0)
    temp_list<<-""
  
  if(input$clear_portfolio==i+1){
    temp_list<<-""
    i<<-i+1
  }
  else
    temp_list<<-paste(temp_list,isolate(input$ticker))
  
  paste("Your current list of stocks: ",temp_list)#,input$ticker,input$start_backtest,input$start_date,input$end_date,input$max_risk)
  
})


#UI output for Sidebar panel 2- MV model options

output$include_options<-renderUI({
  
  checkboxInput("include_options",h5("Allow Use of Options"))
  
})

output$include_fixed_income<-renderUI({
  
  checkboxInput("include_fixed_income",h5("Allow Use of Fixed Income"))
                
})


