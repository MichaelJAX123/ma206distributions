#' Tidy_dbinom returns a data table that pairs number of successes with probabilities given the probability of a single trial and the total number of trials.
#'
#' @param single_trial_prob a numeric value between 0 and 1
#' @param num_trials positive integer which is the total number of trials
#'
#' @return A data frame pairing number of successes with probabilities.
#' @export
#'
#' @examples
#' tidy_dbinom(single_trial_prob = 1/6, num_trials = 4)
#' tidy_dbinom(.5, 10)
#' tidy_dbinom(1/12, 3)
#' tidy_dbinom(.5, 20)
#'
#' library(ggplot2)
#' ggplot(tidy_dbinom(1/6, num_trials = 8)) +
#'   aes(x = num_successes) +
#'   aes(y = probability) +
#'   geom_lollipop()
#'
tidy_dbinom <- function(single_trial_prob = .5, num_trials = 10){

  num_successes <- 0:num_trials
  probability <- dbinom(x = num_successes, size = num_trials, prob = single_trial_prob)

  tibble::tibble(num_successes,probability, single_trial_prob, num_trials)

}

