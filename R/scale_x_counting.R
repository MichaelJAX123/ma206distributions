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



