## ui.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Student Grade Analyzer", titleWidth = 500),
    dashboardSidebar(width = 500),
    dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)