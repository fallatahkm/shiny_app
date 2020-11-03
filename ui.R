library(shiny)
shinyUI(fluidPage(
    titlePanel("Process Performace DPMO App"),
    sidebarLayout(
        sidebarPanel(
            numericInput("numeric", "Identify the required number to be generated",
                         value = 1000, min = 100, max = 1000, step = 100),
            numericInput("numeric_a", "Identify the process's Average",
                         value = 200, min = 1, max = 500, step = 10),
            numericInput("numeric_sd", "Identify the process's Stanad. Dev.",
                         value = 40, min = 1, max = 1000, step = 1),
            sliderInput("sliderx", "Identify the upper and lower customer requirement", 0 , 1000,
                        value = c(150,250)),
            checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide y Axis Label", value = TRUE),
            checkboxInput("show_title", "Show/Hide Title", value = TRUE),
            
         
            actionButton("go", "Go!")
        
            
        ),
        
        mainPanel(
            h4("Predicted Process Defects Per Million Opportunities is:"), 
            h5(textOutput("result"),
               
            tabsetPanel(type = "tabs",
                tabPanel("By Customer Specification ", br(
                    plotOutput("plot1"),
                  
                    ), textOutput("out1")),
                tabPanel("By Statistical Specification", br(
                  
                    plotOutput("plot2")
                    ), textOutput("out2")),
                 tabPanel("Summary Discription", br(), p("- This application is to predict the process performance by
                 understanding process parameter i.e. Mean, stander deviation."),
                          p("- First, by Customer Specification, this is mean adjusting the upper and lower limits according customer need or expect from process."),
                          p('- Second, By Statistical Specification, this is mean the upper and lower limits allocated according to 3 standers deviation from the mean.
                 and the out-limitation point is considered as signals.'),
                          p("- Third, the use must fill all blanket accordingly . the maximum number can be generated is 1000, prosses Average is 500 and stander deviation up to 100."),
                          p("- fourth, press the action bottom the result of Defect Per million at the top of page.")
                                                
                                                    , textOutput("out3")),
                
                tabPanel(" Code Summary", br(),
                         p("applicaiton core: "),textOutput("out4"))
                       
                
                )
            )
    )
)))
