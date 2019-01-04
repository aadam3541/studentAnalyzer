## ui.R ##
library(shiny)
library(shinydashboard)

sidebar <-dashboardSidebar(
  sidebarMenu(
    menuItem("Summary", tabName = "summary", icon = icon("book")),
    menuItem("Graphs", tabName = "graphs", icon = icon("chart-bar"))
  )
)
  
ui <- dashboardPage(
    dashboardHeader(title = "Student Grade Analyzer", titleWidth = 250),
    sidebar,
    dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)