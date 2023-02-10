compute_group_fulcrum <- function(data, scales){

  out <- data.frame(y = -Inf)

  if(!is.null(data$weight)){

    out$x <- sum(data$x*data$weight)/sum(data$weight)

  }else{
  out$x <- mean(data$x)
  }

  out

}



statFulcrum <- ggplot2::ggproto(`_class` = "statFulcrum",
                    `_inherit` = ggplot2::Stat,
                    required_aes = c("x", "y"),
                    compute_group = compute_group_fulcrum)


#' Title
#'
#' @return
#' @export
#'
#' @examples
#' ggplot(cars) +
#' aes(x = speed, y = dist) +
#' geom_point() +
#' geom_fulcrum(color = "red", shape = 2, size = 5)
geom_fulcrum <- function(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = statFulcrum,  # proto object from step 2
    geom = ggplot2::GeomPoint,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}






