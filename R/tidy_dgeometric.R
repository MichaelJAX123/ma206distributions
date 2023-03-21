#' Title
#'
#' @param single_trial_prob
#' @param num_attempts
#'
#' @return
#' @export
#'
#' @examples
#' tidy_dgeometric()
#' tidy_dgeometric(single_trial_prob = 1/6, num_attempts = 10)
tidy_dgeometric <- function(single_trial_prob = .5, num_attempts = 5){



  max_observed_attempts <- num_attempts

  observed_attempt <- 1:max_observed_attempts

  probability <- dgeom( observed_attempt - 1, prob = single_trial_prob)

  cumulative_prob <- pgeom( observed_attempt - 1, prob = single_trial_prob)



  tibble::tibble(observed_attempt, single_trial_prob, probability, cumulative_prob)

}



