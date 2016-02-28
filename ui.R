
library(shiny)
require(markdown)

# Description 
shinyUI(pageWithSidebar(

    # Application title
    headerPanel("Median Price Per Square Feet of Homes Sold in Metro Areas"),
        
    # Side Panel with Date slider and checkbox selection
    sidebarPanel(
        
        sliderInput("date_range", 
                    "Date Range (Year):", 
                    min = 1996,
                    max = 2016,
                    value = c(2012, 2016)),
        uiOutput("metro_select")

    ),
    
    # Main display with tabs
    mainPanel(
        tabsetPanel(
            
            #Tab 1
            tabPanel(p(icon("line-chart"), "Plot View"),
                     plotOutput("distPlot"),
                     actionButton(inputId = "selectDefault", 
                                  label = "Select Default Metro Areas", 
                                  icon = icon("flag")),
                     actionButton(inputId = "clearAll", 
                                  label = "Clear All", 
                                  icon = icon("eject"))
            ),
                # Tab 2
                tabPanel(p(icon("thumbs-o-up"), "About"),
                         includeMarkdown("about.md")
                )

            )
        )
        
        
        
        
    )
)