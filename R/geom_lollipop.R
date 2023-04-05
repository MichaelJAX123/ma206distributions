#' Lollipop geom
#'
#' @description The lollipop is often used to attractively communicate about discrete quantitative distributions.
#'
#' @return a ggplot geom layer
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(data = prize_wheel) +
#' aes(x = payout, y = frequency) +
#' geom_lollipop()
#'
#' library(ggplot2)
#' ggplot(data = prize_wheel) +
#' aes(x = payout, y = frequency) +
#' geom_lollipop(annotate = TRUE)
geom_lollipop <- function(annotate = FALSE, ...){

  if(annotate){
  list(
    geom_post(...),
    geom_point(...),
    geom_post_label()
  )
  }else{
    list(
      geom_post(...),
      geom_point(...)
    )
  }


}
