compute_group_post <- function(data, scales){

  data$xend <- data$x
  data$yend <- 0

  data

}

statPost <- ggplot2::ggproto(`_class` = "statPost",
                    `_inherit` = ggplot2::Stat,
                    required_aes = c("x", "y"),
                    compute_group = compute_group_post)


#' Post geom
#'
#' @description geom_post() may be used to visualize discrete quantitative distributions
#'
#' @return a ggplot2 geom layer
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(data = prize_wheel) +
#' aes(x = payout, y = frequency) +
#' geom_post()
geom_post <- function(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = statPost,  # proto object from step 2
    geom = ggplot2::GeomSegment,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}





