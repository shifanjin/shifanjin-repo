## ---- echo=FALSE, message=FALSE------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(dieroller)

## ------------------------------------------------------------------------
fair_die <- die()
fair_die

## ------------------------------------------------------------------------
# create a loaded die
loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
loaded_die

#die with non-standard sides
weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
weird_die

## ------------------------------------------------------------------------
# roll fair die 50 times
fair50 <- roll(fair_die, times = 50)
fair50

# roll 50 times
set.seed(123)
fair_50rolls <- roll(fair_die, times = 50)
# print
fair_50rolls

# what's in fair50?
names(fair50)
fair50$rolls
fair50$sides
fair50$prob
fair50$total

# string die
str_die <- die(
  sides = c('a', 'b', 'c', 'd', 'e', 'f'),
  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
# roll 20 times
set.seed(123)
str_rolls <- roll(str_die, times = 20)
names(str_rolls)
str_rolls

## ------------------------------------------------------------------------
set.seed(123)
fair50_sum <- summary(fair_50rolls)
fair50_sum

# what's in the summary
class(fair50_sum)
names(fair50_sum)
fair50_sum$freqs

## ------------------------------------------------------------------------
plot(fair_50rolls)

## ------------------------------------------------------------------------
# roll fair die
set.seed(123)
fair_die <- die()
fair500 <- roll(fair_die, times = 500)
# summary method
summary(fair500)

# extracting roll in position 500
fair500[500]

# replacing last roll
fair500[500] <- 1
fair500[500]
#checking
summary(fair500)

# adding 100 rolls
fair600 <- fair500 + 100
#checking
summary(fair600)

# plot method
plot(fair500, 500)

