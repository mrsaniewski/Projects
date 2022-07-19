library(shiny)
library(shinydashboard)
library(ggplot2)
library(caret)
library(plotly)
library(tidyverse)
library(dplyr)
library(plyr)
library(shinythemes)


data(diamonds, package = "ggplot2")
shinyServer(function(input, output, session)
{
  
  df = reactive({
    
    if (is.null(input$files)) {
      return(NULL)
    }
    
    read.csv2(file = input$files$datapath,
              header = input$head,
              sep = input$sep)
    
  })
  
  
  output$show.table = renderTable({
    if (input$show.table) df()[1:100,1:10] else df()[0:input$su1,0:input$su2]
  })
  
  plotly.data = eventReactive(input$show.plot, {
    data.set = df() 
    
    ggplot(data.set, aes(x=Symbol, y=Price/(NetProfit/Actions), color= Company)) +
      geom_point() +  xlab("Company Symbol") + ylab("Price Earining (P/E)") +
      ggtitle("Price Earining (P/E)") +
      theme_light() +
      theme(legend.position = "bottom")
  })
  
  plotly.data2 = eventReactive(input$show.plot2, {
    data.set = df() 
    
    ggplot(data.set, aes(x=Symbol, y=Capitalization/BV, color= Company)) +
      geom_point() + xlab("Company Symbol") + ylab("Price / Book Value (P/BV) ") +
      ggtitle("Price / Book Value (P/BV)") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.data3 = eventReactive(input$show.plot3, {
    data.set = df() 
    
    ggplot(data.set, aes(x=Symbol, y=NetProfit/Actions, color= Company)) +
      geom_point() + xlab("Company Symbol") + ylab("Earning per share ratio") +
      ggtitle("Earning per share ratio") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.data4 = eventReactive(input$show.plot4, {
    data.set = df() 
    
    ggplot(data.set, aes(x=Symbol, y=Price * DividendRate, color= Company)) +
      geom_point() + xlab("Company Symbol") + ylab("Dividend per share ratio") +
      ggtitle("Dividend per share ratio") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.data5 = eventReactive(input$show.plot5, {
    data.set = df() 
    
    ggplot(data.set, aes(x=Symbol, y=(Income/Actions)/Actions, color= Company)) +
      geom_point() + xlab("Company Symbol") + ylab("Productivity per share") +
      ggtitle("Productivity per share") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.data6 = eventReactive(input$show.plot6, {
    data.set = df() 
    
    ggplot(data.set, aes(x=Symbol, y=Price/((Assets-Obligations)/Actions), color= Company)) +
      geom_point() + xlab("Company Symbol") + ylab("Graham's Price / Book Value") +
      ggtitle("Graham's Price / Book Value") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.datao = eventReactive(input$oshow.plot, {
    data.set2 = df2() 
    
    ggplot(data.set2, aes(x=Data, y=Otwarcie)) +
      geom_point() +  xlab("Data") + ylab("Otwarcie") +
      ggtitle("Kurs") +
      theme_light() +
      theme(legend.position = "bottom")
  })
  
  
  output$show.graph = renderPlotly({
    plotly.data()
    
    
  })
  output$show.graph2 = renderPlotly({
    plotly.data2()
    
    
  })
  
  output$show.graph3 = renderPlotly({
    plotly.data3()
    
    
  })
  
  output$show.graph4 = renderPlotly({
    plotly.data4()
    
    
  })
  
  output$show.graph5 = renderPlotly({
    plotly.data5()
    
    
  })
  
  output$show.graph6 = renderPlotly({
    plotly.data6()
    
    
  })
  
  ##Over the years
  
  df2 = reactive({
    
    if (is.null(input$fileso)) {
      return(NULL)
    }
    
    read.csv2(file = input$fileso$datapath,
              header = input$heado,
              sep = input$sepo)
    
  })
  
  

  
  output$oshow.table = renderTable({
    if (input$oshow.table) df2()[1:100,1:10] else df2()[0:input$su3,0:input$su4]
  })
  
  output$oshow.graph = renderPlotly({
    plotly.datao()  
    
  })
  
  plotly.datao = eventReactive(input$oshow.plot, {
    data.set = df2() 
    
    ggplot(data.set, aes(x=Year, y=Price/(NetProfit/Actions), color= Year)) +
      geom_point() +  xlab("Year") + ylab("Price Earning Ratio (P/E)") +
      ggtitle("Price Earning Ratio (P/E)") +
      theme_light() +
      theme(legend.position = "bottom")
  })
  
  plotly.datao2 = eventReactive(input$oshow.plot2, {
    data.set = df2() 
    
    ggplot(data.set, aes(x=Year, y=Price/(BV/Actions), color=Year)) +
      geom_point() + xlab("Year") + ylab("Price / Book Value (P/BV)") +
      ggtitle("Price / Book Value (P/BV)") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.datao3 = eventReactive(input$oshow.plot3, {
    data.set = df2() 
    
    ggplot(data.set, aes(x=Year, y=NetProfit/Actions, color=Year)) +
      geom_point() + xlab("Year") + ylab("Earning per share ratio") +
      ggtitle("Earning per share ratio") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.datao4 = eventReactive(input$oshow.plot4, {
    data.set = df2() 
    
    ggplot(data.set, aes(x=Year, y=Price * DividendRate, color=Year)) +
      geom_point() + xlab("Year") + ylab("Dividend per share ratio") +
      ggtitle("Dividend per share ratio") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.datao5 = eventReactive(input$oshow.plot5, {
    data.set = df2() 
    
    ggplot(data.set, aes(x=Year, y=(Income/Actions)/Actions, color=Year)) +
      geom_point() + xlab("Year") + ylab("Productivity per share") +
      ggtitle("Productivity per share") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  plotly.datao6 = eventReactive(input$oshow.plot6, {
    data.set = df2() 
    
    ggplot(data.set, aes(x=Year, y=Price/((Assets-Obligations)/Actions), color=Year)) +
      geom_point() + xlab("Year") + ylab("Graham's Price / Book Value") +
      ggtitle("Graham's Price / Book Value") +
      theme_light() +
      theme(legend.position = "bottom")
    
  })
  
  output$oshow.graph = renderPlotly({
    plotly.datao()
    
    
  })
  output$oshow.graph2 = renderPlotly({
    plotly.datao2()
    
    
  })
  
  output$oshow.graph3 = renderPlotly({
    plotly.datao3()
    
    
  })
  
  output$oshow.graph4 = renderPlotly({
    plotly.datao4()
    
    
  })
  
  output$oshow.graph5 = renderPlotly({
    plotly.datao5()
    
    
  })
  
  output$oshow.graph6 = renderPlotly({
    plotly.datao6()
    
    
  })
  output$downloadPlot1 <- downloadHandler(
      filename = function(){
        paste("PDFCZ","pdf", sep = ".")
      },
    
      content = function(file){
        pdf(file)
        dev.off()

      
      })
  output$downloadPlot2 <- downloadHandler(
    filename = function(){
      paste("PDFCZ","pdf", sep = ".")
    },
    
    content = function(file){
      pdf(file)
      dev.off()
      
      
    })
  
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("Time:", Sys.time())
  })
  output$currentTime2 <- renderText({
    invalidateLater(1000, session)
    paste("Time:", Sys.time())
  })

 #observeEvent(input$downloadPlot1, {
   #filename= paste("fddp", "pdf", sep="." )
   #export(plotly.data(), file.path(getwd(), filename))
 #}) 
  
  })