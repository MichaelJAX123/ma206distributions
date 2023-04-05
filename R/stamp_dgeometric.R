#' Title
#'
#' @param single_prob
#' @param num_attempts
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot() +
#' stamp_dgeometric()
stamp_dgeometric <- function(single_prob = .5, num_attempts = 10, annotate = FALSE){

    observed_attempt <- 1:num_attempts
    probability <- dgeom( observed_attempt - 1, prob = single_prob)

    df <- tibble::tibble(observed_attempt, probability)

      geom_lollipop(data = df, aes(x = observed_attempt, y = probability), annotate = annotate)

}
