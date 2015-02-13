# for organization of sidebars

#Well Panel 1 - Portfolio
column(4,
	wellPanel(
		checkboxInput("showDataPanel1",h5("More Portfolio Options"),FALSE),
		div(class="row-fluid",div(class="span6",uiOutput("ticker"))),
		div(class="row-fluid",
		    column(6,div(style = "height:50px;", uiOutput("add_ticker"))),
		    column(6,div(style = "height:50px;", uiOutput("clear_portfolio")))       
		), 
		conditionalPanel(condition="input.showDataPanel1",
      div(class="row-fluid",
        column(6,uiOutput("start_date")),
        column(6,uiOutput("end_date"))       
      ),
      div(class="row-fluid",
          column(6,uiOutput("predict_date"))
      ),
      div(class="row-fluid",
          uiOutput("total_money")
      )
		),
	  fluidRow(column(6,uiOutput("run_model")))
	),
  
  # My Portfolio
  wellPanel(
    uiOutput("stock_list"),align= "center"
    ),
  #Download Button
  wellPanel(
    uiOutput("user_report"),align="center"
  ),
  
  # Well Panel 2 - Back Test
	wellPanel(
	  checkboxInput("showDataPanel2",h5("More Mean Variance Options"),FALSE),
	  conditionalPanel(condition="input.showDataPanel2",
	                   uiOutput("include_options"),
	                   uiOutput("include_fixed_income")
    )
	),
	wellPanel(style="height: 300px;")
)
