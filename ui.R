library(shiny)
shinyUI(fluidPage(
    titlePanel("Processes Performace App"),
    sidebarLayout(
        sidebarPanel(
            numericInput("numeric", " Identifid the required to generat?",
                         value = 1000, min = 100, max = 1000, step = 100),
            numericInput("numeric_a", " identifid the process Average?",
                         value = 100, min = 1, max = 1000, step = 10),
            numericInput("numeric_sd", " identifid the process Stanad. Dev.?",
                         value = 10, min = 1, max = 1000, step = 1),
            sliderInput("sliderx", "Identify the Customer sepecification?", 0 , 300,
                        value = c(80,120)),
            checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
            checkboxInput("show_title", "Show/Hide Title")
        ),
        mainPanel(
            h3("Graph of Performance Plotting, According to Customer Specification"),
            plotOutput("plot1"),
            h3("Graph of Performance Plotting, Accoding to Statistical Specification"),
            plotOutput("plot2"),
            h4("Predicted Process Defects Per Milloin Opportuenties is:"),
            h3(textOutput("result"))
        )
    )
))
