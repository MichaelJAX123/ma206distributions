## code to prepare `DATASET` dataset goes here

prize_wheel <- read.csv("data-raw/prize_wheel.csv")

usethis::use_data(prize_wheel, overwrite = TRUE)
