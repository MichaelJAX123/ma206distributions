#' scale_x_counting
#'
#' @description Show x axis guides with ticks at integers
#'
#' @param breaks numeric vector where breaks should be placed
#' @param ...
#'
#' @return ggplot2 scale function
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(tidy_dbinom(1/6, num_trials = 8)) +
#'   aes(x = num_successes) +
#'   scale_x_counting() +
#'   aes(y = probability) +
#'   geom_lollipop()
#'
scale_x_counting <- function(breaks = 0:10000, ...){

  ggplot2::scale_x_continuous(breaks = breaks, ...)

}


#' theme_axis_x_truncated
#'
#' @description Show x axis guides with ticks at integers
#'
#' @param breaks numeric vector where breaks should be placed
#' @param ...
#'
#' @return ggplot2 theme function to indicate that x is right censored
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(tidy_dbinom(1/6, num_trials = 8)) +
#'   aes(x = num_successes) +
#'   scale_x_counting() +
#'   aes(y = probability) +
#'   geom_lollipop() +
#'   theme_axis_x_truncated()

theme_axis_x_truncated <- function(){

  ggplot2::theme(axis.line.x = element_line(color = "black", arrow = arrow(length = unit(0.15, "inches"))))

}
