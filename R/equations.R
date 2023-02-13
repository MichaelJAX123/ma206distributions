plotmath_ev <- latex2exp::TeX("$E[X] = x_1p_1 + x_2p_2 + x_3p_3 ...x_np_n = \\sum_1^n{x_ip_i}$")
plotmath_var <- latex2exp::TeX("$Var(X) = E[(X-\\mu)^2] = \\sigma^2_x = \\sum_1^n(x_i-\\mu)^2p_i$")
plotmath_sd <- latex2exp::TeX("$\\sigma_x = SD(X) = \\sqrt{Var(X)}$")



### stamp equation example
stamp_one_plus_one <- function(x = 0, y = 0, ...){

  annotate(geom = "text",
           label = "1 + 1",
           parse = T,
           x = x, y = y, ...)

}


ggplot() +
  stamp_one_plus_one() +
  stamp_one_plus_one(size = 12, y = 2)


tibble(event = c("totaled", "fender bender", "accident free"),
       probability = c(.01, .09, .9),
       payout = c(20000, 5000, 0)) ->
  expected


expected %>%
  ggplot() +
  aes(x = payout, y = probability) +
  geom_point() +
  geom_segment(aes(xend = payout, yend = 0)) +
  geom_text(aes(label = probability), size = 5,
            vjust = -.5, color = "black") +
  ggxmean::geom_x_mean(aes(weight = probability)) +
  geom_vline(xintercept = sum(c(.01*20000, .09*5000)),
             linetype = "dashed", color = "black") +
  labs(subtitle = "Course idea 8:  The expected value E.V. is the 'balancing point' of a Random variable, X.  It is the weighted average of values, (weighting values by their probabilities). In large samples from the X, the average will be close to the E.V.;" %>% str_wrap(60)) +
  annotate(geom = "label", x =sum(c(.01*20000, .09*5000)), label = sum(c(.01*20000, .09*5000)), y = .5 ) +
  scale_y_continuous(limits = c(0,1)) +
  annotate(geom = "text", label = "E * '[' *X * ']' * {phantom() == phantom()} * x[1]*p[1] + x[2]*p[2] + x[3]*p[3]*...x[n]*p[n] * {phantom() == phantom()} * sum(x[i]*p[i], 1, n) ", parse = T,
           x = 12000, y = .95) +
  annotate(geom = "text", label = "Var(X) * {phantom() == phantom()} * E * '[' *(X - mu)^{2} * ']' * {phantom() == phantom()} * sigma[x]^{2} * {phantom() == phantom()} * sum(, 1, n)*(x[i] - mu)^{2}*p[i] ", parse = T,
           x = 12000, y = .8) +
  annotate(geom = "text", label = "sigma[x] * {phantom() == phantom()} * SD(X) * {phantom() == phantom()} * sqrt(Var(X), ) ", parse = T,
           x = 12000, y = .65)



stamp_eq_ev <- function(x = 0,  y = 0){

  # your work here

}


stamp_eq_var <- function(x = 0,  y = 0){

  # your work here

}

stamp_eq_sd <- function(x = 0,  y = 0){

  # your work here

}



ggplot() +
  stamp_eq_ev() +
  stamp_eq_var(y = -1)+
  stamp_eq_sd(y = -2)

