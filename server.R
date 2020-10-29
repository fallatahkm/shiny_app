library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    output$plot1 <- renderPlot({
        set.seed(2020)
        number_of_point <- input$numeric
        number_avg <- input$numeric_a
        number_sd <- input$numeric_sd
        minx <- input$sliderx[1]
        maxx <- input$sliderx[2]
        datax<- rnorm(number_of_point,number_avg, number_sd)
        xlab <- ifelse(input$show_xlab," X Axis", "")
        ylab <- ifelse(input$show_ylab, "Y Axis", "")
        main <- ifelse(input$show_title, "Title", "")
        hist(datax, xlab = xlab, ylab = ylab, main = main)
        abline(v = minx, col= "green", wld =6); abline(v = maxx, col= "red", wld =6)
    })
    output$plot2 <- renderPlot({
        set.seed(2020)
        number_of_point <- input$numeric
        number_avg <- input$numeric_a
        number_sd <- input$numeric_sd
        minx <- input$sliderx[1]
        maxx <- input$sliderx[2]
        datax<- rnorm(number_of_point,number_avg, number_sd)
        xlab <- ifelse(input$show_xlab," X Axis", "")
        ylab <- ifelse(input$show_ylab, "Y Axis", "")
        main <- ifelse(input$show_title, "Title", "")
        plot(datax, xlab = xlab, ylab = ylab, main = main)
        abline(h = c(-3,3)*input$numeric_sd+input$numeric_a, col= "blue", wld =10)
    })
    output$result <- renderText({
        
        fit <- 1-diff(pnorm(c(input$sliderx[1],input$sliderx[2]),input$numeric_a,input$numeric_sd))
        res <- paste(round(fit*1000000, digits = 1.5),"DPMO" )
        res
    })
})