library(shiny)
library(ggplot2)
library(caret)
library(plotly)
library(tidyverse)
library(dplyr)
library(plyr)
library(shinythemes)
library(shinydashboard)



ui = tagList(
  shinythemes::themeSelector(),
  navbarPage(

  title = "IndiStoX - Indicators of Stocks",theme = shinytheme("spacelab"),
   
  
      
      tabPanel("Home",icon=icon("dashboard"),
        sidebarLayout(
          sidebarPanel(width = 3,
               
               fileInput("files", 
                         "Load file",
                         multiple = FALSE,
                         accept = c(".csv",
                                    "text/csv",
                                    "text/comma-separated-values,text/plain")),
               
               
               
               checkboxInput("head", "Head", TRUE),
               
               radioButtons("sep", "Select columns separator",
                            choices = c(Semicolon = ";",
                                        Comma = ",",
                                        Tab = "\t"),
                            selected = ";"),
               
               
               
               sliderInput("su1", "Lines:", min = 0, max = 20, value=5,
                           step = 1),
               sliderInput("su2", "Columns:", min = 0, max = 10, value=5,
                           step = 1),
               checkboxInput("show.table", "View more data:", FALSE),
               
               tags$hr(),
               
               h1("Show indicators:",style="font-size:25px"),
               
               actionButton("show.plot", "Price Earning (P/E)", class = "btn-primary"),
               
               hr(),
               
               actionButton("show.plot2", "Price / Book Value (P/BV)", class ="btn-primary" ),
               
               hr(),
               
               actionButton("show.plot3", "Earning Per Share (EPS)", class = "btn-primary"),
               
               hr(),
               
               actionButton("show.plot4", "Dividend Per Share", class = "btn-primary"),
               
               hr(),
               
               actionButton("show.plot5", "Productivity Per Share", class = "btn-primary"),
               
               hr(),
               
               actionButton("show.plot6", "Graham's Price / Book Value ", class = "btn-primary"),
               
               tags$hr(),
               
              
              
               
          ),
          mainPanel(
               
               tableOutput("show.table"),
               
               plotlyOutput("show.graph"),
               
               downloadButton("downloadPlot1", "Download P/E"),
               
               plotlyOutput("show.graph2"),
               
               plotlyOutput("show.graph3"),
               
               plotlyOutput("show.graph4"),
               
               plotlyOutput("show.graph5"),
               
               plotlyOutput("show.graph6"),
               br(),
               br(),
               br(),
               h4(textOutput("currentTime")),
               br()
               
              
          )
        )
      ),
      
      
  tabPanel("Over the years",icon = icon("fas fa-chart-line"),
           
           sidebarLayout(
             sidebarPanel(width = 3,
                          
                          fileInput("fileso", 
                                    "Load file",
                                    multiple = FALSE,
                                    accept = c(".csv",
                                               "text/csv",
                                               "text/comma-separated-values,text/plain")),
                          
                          
                          
                          checkboxInput("heado", "Head", TRUE),
                          
                          radioButtons("sepo", "Select columns separator",
                                       choices = c(Semicolon = ";",
                                                   Comma = ",",
                                                   Tab = "\t"),
                                       selected = ";"),
                          
                          
                         
                          
                          sliderInput("su3", "Lines:", min = 0, max = 20, value=5,
                                      step = 1),
                          sliderInput("su4", "Columns:", min = 0, max = 10, value=5,
                                      step = 1),
                          checkboxInput("oshow.table", "View more data", FALSE),
                          
                          
                          
                          tags$hr(),
                          
                          h1("Show indicators:",style="font-size:25px"),
                          
                          actionButton("oshow.plot", "Price Earning (P/E)", class = "btn-primary"),
                          
                          hr(),
                          actionButton("oshow.plot2", "Price / Book Value (P/BV)", class ="btn-primary" ),
                          hr(),
                          
                          actionButton("oshow.plot3", "Earning Per Share (EPS)", class = "btn-primary"),
                          
                          hr(),
                          
                          actionButton("oshow.plot4", "Dividend Per Share", class = "btn-primary"),
                          
                          hr(),
                          
                          actionButton("oshow.plot5", "Productivity Per Share", class = "btn-primary"),
                          
                          hr(),
                          
                          actionButton("oshow.plot6", "Graham's Price / Book Value", class = "btn-primary")
             ),
             mainPanel(
               
               tableOutput("oshow.table"),
               
               plotlyOutput("oshow.graph"),
               downloadButton("downloadPlot2", "Download P/E"),
               
               plotlyOutput("oshow.graph2"),
               
               plotlyOutput("oshow.graph3"),
               
               plotlyOutput("oshow.graph4"),
               
               plotlyOutput("oshow.graph5"),
               
               plotlyOutput("oshow.graph6"),
               br(),
               br(),
               br(),
               h4(textOutput("currentTime2")),
               br()
             
             )
           )
           
          
  ),
  
  
  
   
                   
  
  
  tabPanel("Indicators",icon = icon("fas fa-book-open"),
            tabsetPanel(
              tabPanel("Stock Market Indicators",
                       
                       dashboardBody(
                         br(),
                         h1("Stock Market Indicators"),
                         
                         br(),
                         br(),
                         br(),
                         p("When assessing the attractiveness of stocks in terms of investments, the stock market indicators will be helpful, as they determine the attractiveness of investing money in individual stocks on an ongoing basis. A characteristic feature of investing based on stock market indicators is the elimination of speculation, thanks to which there is no short-term game in which you buy or sell shares on the same day or week. Using stock market indicators, a given company is thoroughly researched, which allows to determine whether by buying its shares, it will bring profit in the future.
                          ",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                       )
                       
              ),
             tabPanel("Price Earning Ratio (P/E)",
                      
                      dashboardBody(
                        br(),
                        h1("Price Earning Ratio (P/E)"),
                       
                        br(),
                        br(),
                        br(),
                        p("One of the most popular is the price / earnings ratio, it represents the ratio of the price of a single share to the earnings per share that the company has made in the last year. For example, if the price (P) of a company's share is worth PLN 50, and the company has earned PLN 10 of profit (E) per share, then P / E will have a value of 5. Very often this index is interpreted as the price to be paid for each share. zloty of the company's profit. In this case, it is PLN 5. The most important thing is to understand that too high a value of this index means an overvalued stock price. The pattern of the indicator is shown below.
                          ",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                      )
                   
                      ),
             
             tabPanel("Price / Book Value (P/BV)",
                      
                      dashboardBody(
                        br(),
                        h1("Price / Book Value (P/BV)"),
                        
                        br(),
                        br(),
                        br(),
                        p("Another of the most popular is the price / book value ratio [X], it informs about the ratio of the company's market value to the company's book value resulting from the value of its assets. It shows how much you have to pay for PLN 1 of the company's assets. For example, if the C / Wk value is 1.4, then PLN 1.20 should be paid for each zloty of property. The low ratio is attractive, but it can also be a sign of the company's financial difficulties. A high index may be a harbinger of the company's future development.", style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                      )
                      ),
             
             tabPanel("Earning Per Share (EPS)",
                      
                      dashboardBody(
                        br(),
                        h1("Earning Per Share (EPS)"),
                       
                        br(),
                        br(),
                        br(),
                        p("One of the key indicators is earnings per share (EPS). On its basis, it is determined what is the net profit per share of a given company, it is calculated after deducting the dividends paid. The pattern on EPS is very simple, which certainly contributed to its popularity. To calculate it, we need to divide the net profit by the sum of all shares. It is better for the investor when the indicator has a high value. It tells him how much profit was earned by the capital invested by him.", style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                      )
             ),
             tabPanel("Dividend Per Share",
                      
                      dashboardBody(
                        br(),
                        h1("Dividend per share ratio"),
                      
                        br(),
                        br(),
                        br(),
                        p("One of the indicators investors observe is the dividend per share ratio. Dividends are money paid to shareholders as compensation for providing capital. On its basis, information is obtained about the amount that will be received by a shareholder being a share in the company's profit for each share held by him. In this case, it is important to compare the data in time series. If the trend is increasing, it is expected to continue in the future. However, one should be careful, because when the company records losses for another year in a row, and the general meeting or the shareholders' meeting decides to allocate huge funds for dividends, one should not hesitate to save from the sinking ship. However, the reason for the increase in the ratio may not only be an increase in profit, but also higher dividend payments that were made at the expense of the company's development in the future. Mature markets are characterized by high dividend ratios, which means that investors are able to live thanks to them.", style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                      )
             ),
             tabPanel("Productivity Per Share",
                      
                      dashboardBody(
                        br(),
                        h1("Productivity per share"),
                      
                        br(),
                        br(),
                        br(),
                        p("The index describing the size of the company's activity is the productivity index of one share. Its increase is a very favorable phenomenon, because even if profitability is maintained, it is indicative of the development of the entity and increases the earnings per share.", style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                      )
             ),
             tabPanel("Graham's Price / Book Value",
                      
                      dashboardBody(
                        br(),
                        h1("Graham's Price / Book Value"),
                      
                        br(),
                        br(),
                        br(),
                        p("When calculating another ratio - C / WK Graham, no intangible assets and fixed assets are taken into account. Only current assets are taken into account. If anything was left of these calculations, the obtained result was divided by the number of shares. Benjamin Graham invested only in companies for which the value of the calculated ratio was positive and amounted to approximately 0.7. Thus, when the company's shares were quoted for no more than 2/3 of the value obtained from the formula, he immediately bought them. Searching for such investment opportunities was a long time in his day. He made all the calculations manually, reviewing the financial results of companies, but his rate of return on investment was impressive year on year.", style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:750px")
                      )
             )
            )
),

tabPanel("Tutorial", icon = icon("fas fa-info"), 
         navlistPanel(widths = c(3,5),
                      "Tutorial",
                      tabPanel("1. Home",
                               br(),
                               br(),
                                      p("This is the home page where you can calculate and view graphs of listed companies compared to other companies."),
                               br(),
                               br(),
p(" Step by step:"),
p("1. We load data in tabular format, which should contain data in the following columns: Symbol, Price, Capitalization, Book Value, Dividend, Actions, Assets, Obligation, Net Profit, Income."),
p("2. Below we choose whether the read data contains headers and what separator separates the data."),
p("3. After loading the data, we can use the sliders to determine how much we want to see them on the main screen."),
p("4. Click the buttons of the indicators you want to view."),
                      ),
                      tabPanel("2. Over the years",
                               br(),
                               br(),  
                               p("This is a subpage where you can calculate and display graphs of changes over the years of a listed company."),
                               br(),
                               br(),
p(" Step by step:"),
p("1. We load data in tabular format, which should contain data in the following columns: Symbol, Price, Capitalization, Book Value, Dividend, Actions, Assets, Obligation, Net Profit, Income."),
p("2. Below we choose whether the read data contains headers and what separator separates the data."),
p("3. After loading the data, we can use the sliders to determine how much we want to see them on the main screen."),
p("4. Click the buttons of the indicators you want to view."),
                      ),
                      tabPanel("3. Indicators",
                               br(),
                               br(),
                               p("On this page you will find explanations of what the individual stock market indicators in this application mean.")
                      ),
                      tabPanel("4. Plots",
                               br(),
                               br(),
                               p("All application plots are interactive, rich in different kinds of functions in the upper right corner of each one."),
                               p("The graph can be downloaded as a png image in the functions in the upper right corner by clicking the camera icon or as a pdf file by clicking the button below the graph.")
                      ),
                      tabPanel("5. Themes",
                               br(),
                               br(),
                               p("In the upper right corner, a window is displayed that allows you to change the application theme. Just expand the list and choose a theme. The window can be freely moved.")
                      )
         ),
         
         
),
  
      
  navbarMenu("About", icon = icon("far fa-address-card"),
           
           tabPanel("Aplication",
                   
                    h1("About Aplication", style="font-size:45px"),
                    br(),
                    br(),
                    
                    fluidRow(
                      column(4,
                             h1("Destiny"),
                             br(),
                             p("The application is a tool for people investing in the stock exchange or people who are just going to get acquainted with the stock exchange mechanism.",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:450px"),
                             br(),
                             
                      ),
                      column(4,
                             h1("Purpose"),
                             br(),
                             p("The application was made as part of the Bachelor Thesis. It is used to report selected relevant stock market indicators for a selected test set of stock exchange data.",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:450px"),
                             br(),
                             
                      ),
                      column(4,
                             h1("How"),
                             br(),
                             p("The application was made entirely in R language, mainly using the Shiny package.",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:450px"),
                             br(),
                             
                      )
                    )
                    ),
           
           tabPanel("Author",
                    
                    
                      
                      h1("About Author", style="font-size:45px"),
                    br(),
                    br(),
                      fluidRow(
                        column(6,
                               h1("Who"),
                               br(),
                               p("My name is Karol, I am a 3rd year student of Computer Science and Econometrics at the University of Bialystok.",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:550px"),
                               br(),
                             
                        ),
                        column(6,
                               h1("Experience"),
                               br(),
                               p("This is my first R-language web application, but I hope it will not be the last.",style="font-size:17px;text-align:center;color:black;background-color:gainsboro;padding:50px;border-radius:10px;border: 2px solid black;width:550px"),
                               br(),
                               
                        )
                      
                      )
                    
           )
         
           
  )
  
    
      
    )
)
    
    

  
    

