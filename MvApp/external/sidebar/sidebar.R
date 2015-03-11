# for organization of sidebars

#Well Panel 1 - Portfolio
column(4,
       wellPanel(
         checkboxInput("showDataPanel1",h5("More Portfolio Options"),FALSE),
         div(class="row-fluid",div(class="span6",uiOutput("ticker"))),
         conditionalPanel(condition="input.showDataPanel1",
                          fluidRow(
                            column(6,uiOutput("start_date")),
                            column(6,uiOutput("end_date"))       
                          ),
                          fluidRow(
                            column(6,uiOutput("predict_date"))
                          )
         )
       ),
       # My Portfolio
       wellPanel(
         uiOutput("run_model"),align= "center"
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
