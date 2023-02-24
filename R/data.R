#' Example problem data
#'
#' Data from chapter 11 of MA206's text book
#' @examples
#' prize_wheel
#'
#' library(ggplot2)
#' ggplot(prize_wheel) +
#'     aes(x = payout, y = frequency) +
#'     geom_lollipop()
#'
#' @format ## `prize_wheel`
#' A data frame with 3 rows and 3 columns:
#' \describe{
#'   \item{sector_type}{type of pie slice from prize wheel}
#'   \item{frequency}{proportion of pie slice of that type}
#'   \item{payout}{how much is paid out in the case landing on slice}
#'   ...
#' }
#' @source <ISI chapter II>
"prize_wheel"

