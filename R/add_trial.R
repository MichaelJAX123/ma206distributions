# # Define the FibonacciSequence class
# setClass(
#   "FibonacciSequence",
#   slots = list(
#     first = "numeric",
#     second = "numeric",
#     prev = "numeric",
#     current = "numeric"
#   )
#   # prototype = list(
#   #   first = numeric(),
#   #   second = numeric(),
#   #   prev = numeric(),
#   #   current = numeric()
#   # )
# )
#
# # Define a method for initializing the FibonacciSequence object
# initialize.FibonacciSequence <- function(.Object, first, second) {
#   .Object@first <- first
#   .Object@second <- second
#   .Object@prev <- NA
#   .Object@current <- NA
#   .Object@upcoming <- first + second
#   return(.Object)
# }
#
# # Define a method for advancing the FibonacciSequence object
# setMethod("advance_fibonacci", "FibonacciSequence", function(object) {
#   object@prev <- object@current
#   object@current <- object@upcoming
#   object@upcoming <- object@current + object@prev
#   return(object)
# })
#
# # Define a function to create a new FibonacciSequence object
# start_fibonacci <- function(first = 1, second = 1) {
#   fs <- new("FibonacciSequence", first = first, second = second)
#   return(fs)
# }
#
#
#
# advance_fibonacci <- function(fib_seq) {
#   # Update the slots in the FibonacciSequence object
#   fib_seq@prev <- fib_seq@current
#   fib_seq@current <- fib_seq@upcoming
#   fib_seq@upcoming <- fib_seq@prev + fib_seq@current
#
#   # Return the updated FibonacciSequence object
#   return(fib_seq)
# }
#
# # Create a new FibonacciSequence object with first = 1 and second = 1
# fs <- start_fibonacci(first = 1,
#                       second = 1)
#
# # Advance the sequence and get the next value
# value <- fs %>% advance_fibonacci() %>% `$`("current")
# # value is 2
#
#
# library(shiny)
# library(codeModules)
# shinyApp(
#   fluidPage(
#         sliderInput(inputId = "x",
#                     label = "x",
#                     step = 1,
#                     min = 10,
#                     max = 200,
#                     value = 16
#         ),
#     mainPanel(
#       codeOutput("code_out"),
#       plotOutput("plot_out")
#     )
#
#   ),
#
#   function(input, output, session){
#
#     output$code_out <- renderCode({
#       paste("1 +", input$x)
#     }, delay = c(100, 1000, 3000))
#
#
#     output$plot_out <- renderPlot({
#       ggplot(cars) + aes(speed, dist) + geom_point(alpha = input$x/200)
#
#     })
#   }
# )
