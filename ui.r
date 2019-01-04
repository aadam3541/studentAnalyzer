## ui.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Student Grade Analyzer"),
    dashboardSidebar(),
    dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)