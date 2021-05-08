## ui.R
library(shiny)
library(shinydashboard)
library(recommenderlab)
library(data.table)
library(ShinyRatingInput)
library(shinyjs)

source('functions/helpers.R')
genre <- c('Animation' ,'Children' ,'Comedy', 'Adventure', 'Fantasy', 'Romance', 'Drama', 'Action' ,'Crime' ,'Thriller' ,'Horror', 'SciFi', 'Documentary' ,'War' ,'Musical', 'Mystery' ,'FilmNoir', 'Western')


shinyUI(
    dashboardPage(
          skin = "blue",
          dashboardHeader(title = "Movie Recommender"),
          
          dashboardSidebar(disable = TRUE),

          dashboardBody(includeCSS("css/movies.css"),
                        
                        
              fluidRow(
                  box(width = 12, title = "Step 1: Rate as many books as possible", status = "info", solidHeader = TRUE, collapsible = TRUE,
                      div(class = "rateitems",
                          uiOutput('ratings')
                      )
                  )
                ),
              
              fluidRow(
                  useShinyjs(),
                  box(
                    width = 12, status = "info", solidHeader = TRUE,
                    title = "Step 2: Discover books you might like",
                    br(),
                    withBusyIndicatorUI(
                      actionButton("btn", "Click here to get your recommendations", class = "btn-warning")
                    ),
                    br(),
                    tableOutput("results"))),
              
              
        ### Movies based on SYSTEM I
              
              fluidRow(
                useShinyjs(),
                  box(width = 12, title = "2a. Choose your favorite Genre", status = "info", solidHeader = TRUE, collapsible = TRUE,
              
                      radioButtons("genre1", "What's your favourite Genre?", genre))),
              
              
              fluidRow(
                useShinyjs(),
                box(
                  width = 4, status = "info", solidHeader = TRUE,
                  title = "Step 2b: Here are some recommended movie based on your Genre",
                  br(),
                  withBusyIndicatorUI(
                    actionButton("btn1", "Recommendation Based on Highest Rating", class = "btn-warning")
                  ),
                  br(),
                  tableOutput("results2"),
                  br(),
                  
                  withBusyIndicatorUI(
                    actionButton("btn2", "Recommendation Based on Popularity", class = "btn-warning")
                  ),
                  br(),
                  tableOutput("results3")
                  
                  ))
                    
                  )
               )
          )
    
    

