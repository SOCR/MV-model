output$main_plot <- renderPlot({
  
  column(8,
         tabsetPanel(
           tabPanel(title="Main Mean Variance Graph",
                    plotOutput({
                      
                      if(!is.null(input$run_model))
                        if(input$run_model!=0){
                          isolate({
                            withProgress(session, {
                              setProgress(message = "Downloading Data, please wait",
                                          detail = "This may take a few moments...")
                              isolate({get_mv_graph(input$ticker,input$start_date,input$end_date)
                              })
                              setProgress(detail = "Done")
                              Sys.sleep(1)
                            })
                            
                          })
                        }
                      
                    }  
                    )
           )
         )
         
  )
  
  
  #   withProgress(session, min = 0, max = 10, {
  #     setProgress(message = "Loading, wait for it....")
  #     Sys.sleep(3)
  #     }
  #   )
})