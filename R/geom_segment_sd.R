compute_group_sd_segment <- function(data, scales){

  out <- data.frame(y = -Inf)
  out$yend = -Inf

  if(!is.null(data$weight)){

    out$x <- sum(data$x*data$weight)/sum(data$weight)
    out$xend <- sqrt(sum((data$x - out$x)^2*data$weight)/data$weight)

  }else{
  out$x <- mean(data$x)

  sd <- sd(data$x)

  out$xend <- out$x + sd
  }

  out

}



statSegmentsd <- ggplot2::ggproto(`_class` = "statSegmentsd",
                    `_inherit` = ggplot2::Stat,
                    required_aes = c("x", "y"),
                    compute_group = compute_group_sd_segment)


#' Title
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#' aes(x = speed, y = dist) +
#' geom_point() +
#' geom_fulcrum(color = "red", shape = 2, size = 5) +
#' geom_segment_sd(color = "red", size = 3)
geom_segment_sd <- function(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = statSegmentsd,  # proto object from step 2
    geom = ggplot2::GeomSegment,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}






