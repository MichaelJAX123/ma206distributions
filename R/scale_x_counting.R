#' Title
#'
#' @param breaks
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
scale_x_counting <- function(breaks = 0:10000, ...){

  ggplot2::scale_x_continuous(breaks = breaks, ...)

}


