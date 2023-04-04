## code to prepare `DATASET` dataset goes here

prize_wheel <- read.csv("data-raw/prize_wheel.csv")

usethis::use_data(prize_wheel, overwrite = TRUE)


coin_flip <- tibble::tibble(outcome = c("heads", "tails"))

coin_flip_fair <- tibble::tibble(outcome = c("heads", "tails"),
                         prob = c(.5,.5))

coin_flip_win <- tibble::tibble(outcome = c("heads", "tails"),
                                 prob = c(.5,.5),
                                value = 1:0)

usethis::use_data(coin_flip, overwrite = TRUE)
usethis::use_data(coin_flip_fair, overwrite = TRUE)
usethis::use_data(coin_flip_win, overwrite = TRUE)
