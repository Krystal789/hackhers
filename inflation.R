library(shiny)
library(dplyr)
library(ggplot2)

# Load the inflation data
inflation_data <- read.csv("inflationRate.csv", header = TRUE)

# Create a Shiny app
ui <- fluidPage(
  # Add a title to the app
  titlePanel("Inflation Line Chart"),
  
  # Add the inputs for year_start and year_end
  sidebarLayout(
    sidebarPanel(
      selectInput("year_start", "Start Year:", 
                  c(unique(as.character(inflation_data$Year)))),
      selectInput("month_start", "Start Month:", 
                  c(unique(as.character(inflation_data$Month)))),
      selectInput("year_end", "End Year:", 
                  c(unique(as.character(inflation_data$Year)))),
      selectInput("month_end", "End Month:", 
                  c(unique(as.character(inflation_data$Month))))
    ),
    
    # Add the plot to the main panel
    mainPanel(
      plotOutput("line_chart")
    )
  )
)

# Define the server function
server <- function(input, output) {
  
  # Create a reactive object to hold the selected data
  selected_data <- reactive({
    inflation_data %>% 
      filter(Year >= as.numeric(input$year_start) & 
               Year <= as.numeric(input$year_end) & 
               Month >= input$month_start & 
               Month <= input$month_end)
  })
  
  # Create the line chart
  output$line_chart <- renderPlot({
    ggplot(selected_data(), aes(Month, Value)) + 
      geom_line() + 
      labs(x = "Month", y = "Inflation Value") + 
      ggtitle("Inflation Line Chart")
  })
  
}

# Run the app
shinyApp(ui = ui, server = server)
