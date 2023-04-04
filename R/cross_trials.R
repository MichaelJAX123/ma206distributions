
# coin_flip <- tibble(outcome = c("heads", "tails"))
#
# crossing(one_flip, one_flip, .name_repair = "none")

#' Title
#'
#' @param trial
#' @param num_trials
#'
#' @return
#' @export
#'
#' @examples
#' library(dplyr)
#' prize_wheel |>
#'    mutate(prob = frequency/sum(frequency)) |>
#'    cross_trials(num_trials = 2)
#'
#' bernoulli_trial(.1) %>%
#' cross_trials(num_trials = 3)
#'
cross_trials <- function(trial = prize_wheel, num_trials = 2){

  df <- trial
  names(df) <- paste0("t", 1,"_", names(df))

  if(num_trials > 1){
  for (i in 2:num_trials){

    temp <- trial
    names(temp) <- paste0("t", i,"_", names(trial))

    df <- tidyr::crossing(df, temp)

  }
  }

  df

}

# cross_trials(num_trials = 15) %>%
#   mutate(collective_outcome = row_number()) %>%
#   pivot_longer(cols = -collective_outcome)
#
#
# tibble(outcome = 0:1) %>%
#   cross_trials(num_trials = 7) %>%
#   mutate(collective_outcome = row_number()) %>%
#   pivot_longer(cols = -collective_outcome) %>%
#   group_by(collective_outcome) %>%
#   summarise(num_successes = sum(value)) %>%
#   count(num_successes) %>%
#   mutate(prob = n/sum(n))

#' Title
#'
#' @param prob
#'
#' @return
#' @export
#'
#' @examples
#' bernoulli_trial()
#' bernoulli_trial(.666)
bernoulli_trial <- function(prob = .25){

  tibble::tibble(outcome = 0:1, prob = c(1-prob, prob))

}


