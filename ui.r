## ui.R ##
library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(plyr)

# Read csv file and save in dataframe
myData <- read.csv(file="Book1.csv", header=TRUE, sep=",")

averages <- t(data.frame(colMeans(myData)))
averages <- data.frame(averages[, -1])

# Create a bar graph from the dataframe
averagePlot <- ggplot(data=averages, aes(x=c("GPA", "Midterm 1", "Midterm 2", "Final", "Homework"), y=averages$averages....1.)) +
  geom_bar(stat="identity") + 
  theme_minimal() +
  labs(x = "Statistic", y = "Average")

# Create the sidebar
sidebar <-dashboardSidebar(
  sidebarMenu(
    menuItem("Summary", tabName = "summary", icon = icon("book")),
    menuItem("Graphs", tabName = "graphs", icon = icon("chart-bar"))
  )
)

# Create the UI
ui <- dashboardPage(
  # Assign title to the header
  dashboardHeader(title = "Student Grade Analyzer", titleWidth = 250),
  sidebar,
  dashboardBody(
    # Create bodies for each tab on the sidebar
    tabItems(
      # Summary tab body
      tabItem(tabName = "summary",
              box(title = "Histogram", status = "primary", plotOutput(averagePlot, height = 250))),
      # Graphs tab body
      tabItem(tabName = "graphs", h2("Hi"))
      ),
    # Create a fluid row and input a box with "plot2"
    fluidRow(
      box(plotOutput("plot1"))
    )
  )
)
    

server <- function(input, output) { 

  # Load the data into a dataframe
  clinicalData <- read.csv(file="C:/Users/aadam/Downloads/NLP data.csv", header=TRUE, sep=",")
  
  # Create a data frame of the number of occurences of each "TYPE"
  typeCount <- count(clinicalData, "Type")
  
  
  output$plot1 <- renderPlot({
    # Create a bar graph of the typeCount dataframe
    ggplot(data=typeCount, aes(x=Type, y=freq)) +
      geom_bar(stat="identity") + 
      scale_x_discrete(limits = typeCount$Type) +
      theme_minimal() +
      labs(x = "Type", y = "Number of Occurences")
  })
    
}

# Create the actual app by loading the UI and server
shinyApp(ui, server)

