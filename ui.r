## ui.R ##
library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)

# Read csv file and save in dataframe
myData <- read.csv(file="Book1.csv", header=TRUE, sep=",")

averages <- t(data.frame(colMeans(myData)))
averages <- data.frame(averages[, -1])

# Create a bar graph from the dataframe
averagePlot <- ggplot(data=averages, aes(x=c("GPA", "Midterm 1", "Midterm 2", "Final", "Homework"), y=averages$averages....1.)) +
  geom_bar(stat="identity") + 
  theme_minimal() +
  labs(x = "Statistic", y = "Average")

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
      ),
    fluidRow(
      box(plotOutput("averagePlot"))
    )
  )
)
    


server <- function(input, output) { }

shinyApp(ui, server)