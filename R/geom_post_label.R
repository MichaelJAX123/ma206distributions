compute_group_post_label <- function(data, scales, round_digits = 3){

  return_small = rep(0, round_digits - 1) %>% paste(collapse = "") %>% paste0("< .", . , "1")

  data$xend <- data$x
  data$yend <- 0
  data$label <- round(data$y, round_digits)
  data$label <- ifelse(data$label == 0 , return_small, data$label)

  data

}

statPostlabel <- ggplot2::ggproto(`_class` = "statPostlabel",
                    `_inherit` = ggplot2::Stat,
                    required_aes = c("x", "y"),
                    compute_group = compute_group_post_label)


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
#' geom_post() +
#' geom_post_label()
#'
#'tidy_dbinom(single_trial_prob = 1/6, num_trials = 10) %>%   # from ma206distributions
#'ggplot() +
#'  aes(x = num_successes,
#'      y = probability) +
#'  geom_lollipop(annotate = TRUE,
#'                round_digits = 2) +                            # from ma206distributions
#'  scale_x_counting()                 # from ma206distributions
#'
geom_post_label <- function(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  vjust = -.6, ...) {
  ggplot2::layer(
    stat = statPostlabel,  # proto object from step 2
    geom = ggplot2::GeomText,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, vjust = vjust, ...)
  )
}





