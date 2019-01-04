## ui.R ##
library(shiny)
library(shinydashboard)

sidebar <-dashboardSidebar(
  sidebarMenu(
    menuItem("Summary", tabName = "summary", icon = icon("book")),
    menuItem("Graphs", icon = icon("chart-bar"), tabName = "graphs")
  )
)
  
ui <- dashboardPage(

    
    dashboardHeader(title = "Student Grade Analyzer", titleWidth = 500),
    sidebar,
    dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)