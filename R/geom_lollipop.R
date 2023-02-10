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
