library(shiny)
library(ggplot2)
library(plotly)

shinyServer(function(input, output) {
    output$plot1 <- renderPlot({
        set.seed(2020)
        number_of_point <- input$numeric
        number_avg <- input$numeric_a
        number_sd <- input$numeric_sd
        minx <- input$sliderx[1]
        maxx <- input$sliderx[2]
        datax <- rnorm(number_of_point,number_avg, number_sd)
        
        xlab <- ifelse(input$show_xlab," Process Distribution", "")
        ylab <- ifelse(input$show_ylab, "Frquency", "")
        main <- ifelse(input$show_title, "Graph of Performance Plotting, According to Customer Specification", "")
        hist(datax , xlab = xlab, ylab = ylab, main = main, xlim = c(0, 500))
        abline(v = minx, col= "green", lwd = 3); abline(v = maxx, col= "red", lwd = 3)
    
    })
    output$plot2 <- renderPlot({
        set.seed(2020)
        number_of_point <- input$numeric
        number_avg <- input$numeric_a
        number_sd <- input$numeric_sd
        output$out1 <- renderText(input$box1)
        output$out2 <- renderText(input$box2)
    
        minx <- input$sliderx[1]
        maxx <- input$sliderx[2]
        datax<- rnorm(number_of_point,number_avg, number_sd)
        xlab <- ifelse(input$show_xlab,"Frquency", "")
        ylab <- ifelse(input$show_ylab, "Process Distribution", "")
        main <- ifelse(input$show_title, "Graph of Performance Plotting, Accoding to Statistical Specification", "")
        plot(datax, col = "red", ylab = ylab,xlab = xlab, main = main)
        abline(h = c(-3,3)*input$numeric_sd+input$numeric_a, col= "blue", lwd =3)
        
    })
    output$result <- renderText({
      
       fit <- 1-diff(pnorm(c(input$sliderx[1],input$sliderx[2]),input$numeric_a,input$numeric_sd))
       
       fitx <- eventReactive(input$go, {
         fit
       })
      
        res <- paste(round(fitx()*1000000, digits = 1.5),"DPMO" )
        res
    })
})
