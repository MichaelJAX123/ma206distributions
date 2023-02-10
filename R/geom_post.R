compute_group_post <- function(data, scales){

  data$xend <- data$x
  data$yend <- 0

  data

}

statPost <- ggplot2::ggproto(`_class` = "statPost",
                    `_inherit` = ggplot2::Stat,
                    required_aes = c("x", "y"),
                    compute_group = compute_group_post)


#' Title
#'
#' @return
#' @export
#'
#' @examples
#' ggplot(cars) +
#' aes(x = speed, y = dist) +
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





#' Title
#'
#' @return
#' @export
#'
#' @examples
#' ggplot(cars) +
#' aes(x = speed, y = dist) +
#' geom_lollipop()
geom_lollipop <- function(){

  list(
  geom_post(),
  geom_point()
  )

}
