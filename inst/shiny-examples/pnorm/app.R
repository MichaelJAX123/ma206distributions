#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#'

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("What does pnorm(x = z) do?" ),

    titlePanel("Integrates under the normal from -infinity to Z" ),



    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("z",step = .02,
                        "Z:",
                        min = -5,
                        max = 5,
                        value = 0)

        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            verbatimTextOutput("distText")
        )
    ),

    # titlePanel(x_mod)


)




"library(ggplot2)
library(ggxmean)
ggxmean:::stamp_space() +
        stamp_normal_dist(alpha = .1) + #
        stamp_normal_dist(sd_max = input$z,
                                   alpha = .8,
                                   fill = 'plum4') +
geom_vline(xintercept = input$z, color = 'plum4') +
ggstamp::stamp_label(x = input$z, y = .1, label = paste0('Z = ', input$z)) +
ggstamp::stamp_label(x = 3, y = .32, size = 7,
label = paste0('pnorm(z) = ',
pnorm(input$z) %>% round(3)))" ->
    for_shiny


# Define server logic required to draw a histogram
server <- function(input, output) {





    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R


        eval(parse(text = for_shiny))

    })

    output$distText <- renderText({

        for_shiny %>%
            str_replace_all("input\\$z", as.character(input$z))

    })


}

# Run the application
shinyApp(ui = ui, server = server)

#' ->
#my_shiny_app


#eval(parse(text = my_shiny_app))
