## Shiny App


## DV6 ####

setwd("C:/Users/vanil/OneDrive/Documents/RStudio/Shiny1")
getwd()

install.packages("shiny")
library(shiny)

#Part 1
ui <- fluidPage(

  titlePanel("Bee Colonies"),
  sidebarLayout(
    sidebarPanel(
      #sliderInput(inputId = "year",
      # label = "Year",
      #  min = 2015,
      #   max = 2021,
      #    value = 2018,
      #     step = 1),
      selectInput("state", "State:",
                  choices = colnames(colony_wide3)),
      hr(),
      helpText("Data Source: USDA"),
    ),
    mainPanel(
      plotOutput("colonyPlot")
        )
  )
)
#Part 2
server <- function(input, output) {
  output$colonyPlot <- renderPlot({
    barplot(colony_wide3[,input$state],
            main = input$state,
            ylab = "Bee Colonies",
            xlab = "Year",
            col = "gold1")
  })
}

# Part 3
shinyApp(ui = ui, server = server)

#runApp("my_app")