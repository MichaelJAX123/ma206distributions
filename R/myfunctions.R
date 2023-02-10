
library(tidyverse)


######### Can you put this into a function with
##### arguments single_trial_prob and num_trials
#### suggested defaults are .5 and 10

single_trial_prob <- .5
num_trials <- 10
num_successes <- 0:num_trials

probability <- dbinom(x = num_successes,
       size = 10,
       prob = single_trial_prob)

tibble::tibble(num_successes, probability, single_trial_prob, num_trials)

#### here is the scaffolding for your function
tidy_dbinom <- function(single_trial_prob = .5, num_trials = 10){

  # put function contents here :-)


}

#### if you call the function, you should get a tidy dataframe back
tidy_dbinom()
tidy_dbinom(.2, 10)
tidy_dbinom(.8, 10)
tidy_dbinom(.5, 6)

