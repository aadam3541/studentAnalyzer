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
  dashboardBody(
    tabItems(
      tabItem(tabName = "summary",
              box(title = "Histogram", status = "primary", plotOutput("plot2", height = 250))),
      tabItem(tabName = "graphs", h2("Hi"))
      )
  )
      )
    


server <- function(input, output) { }

shinyApp(ui, server)