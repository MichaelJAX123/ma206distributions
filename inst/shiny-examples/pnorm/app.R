# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com/

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
            sliderInput("z",
                        step = .02,
                        "Probability for single trial success:",
                        min = 0,
                        max = 1,
                        value = .25),

        # Sidebar with a slider input for number of bins
                sliderInput("n",
                            step = 1,
                            "N:",
                            min = 1,
                            max = 100,
                            value = 10)
            ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            verbatimTextOutput("distText")
        )
    ),

    # titlePanel(x_mod)
)




'library(ggplot2)
library(ma206distributions)
ggplot() +
  stamp_dbinom(single_trial_prob = input$z, num_trials = input$n) +    # from ma206distributions
  scale_x_counting() +                                        # from ma206distributions
  labs(title = "Probability of rolling 0,1,2,...10 sixes when rolling a fair die 10 times")' ->
    for_shiny


# Define server logic required to draw a histogram
server <- function(input, output) {





    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R


        eval(parse(text = for_shiny))

    })

    output$distText <- renderText({

        for_shiny %>%
            str_replace_all("input\\$z", as.character(input$z)) %>%
            str_replace_all("input\\$n", as.character(input$n))

    })


}

# Run the application
shinyApp(ui = ui, server = server)

#' ->
#my_shiny_app


#eval(parse(text = my_shiny_app))
