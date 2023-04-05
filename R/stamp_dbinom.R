#' stamp_dbinom
#'
#' @description stamp_dbinom returns a plot that plots the number of successes with probabilities given the probability of a single trial and the total number of trials.
#' @param single_trial_prob  numeric value between 0 and 1
#' @param num_trials positive integer which is the total number of trials
#' @return A plot that plots the number of success with associated probabilities
#' @export
#' @examples
#' library(ggplot2)
#' ggplot() +
#' stamp_dbinom()
#'
#' ggplot() +
#' stamp_dbinom(single_trial_prob = 1/12,
#' num_trials = 3,
#' annotate=TRUE)
#'
stamp_dbinom <- function(single_trial_prob = .5, num_trials = 10, annotate = FALSE){

  geom_lollipop(annotate = annotate,
                data = tidy_dbinom(single_trial_prob = single_trial_prob,
                                   num_trials = num_trials),
                mapping = ggplot2::aes(x = num_successes, y = probability))

}
