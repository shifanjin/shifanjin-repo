# ===================================================================
# Title: binomial-functions.R
# Description:
#   This script is basically writing functions for the binomial 
#   probability function in different forms.
# Author: Shi Fan Jin
# Date: 3-20-2018
# ===================================================================



#' @title whether or not it is an integer
#' @description checks whether or not it is an integer
#' @param x any input
#' @return True or False of whether it is an interger or not
is_integer <- function(x) {
  if (x %% 1 != 0) {
    return(FALSE)
  }else {
    return(TRUE)
  }
}

# TRUE s
is_integer(-1) 
is_integer(0) 
is_integer(2L) 
is_integer(2)
# FALSE s
is_integer(2.1) 
is_integer(pi) 
is_integer(0.01)



#' @title whether or not it is positive
#' @description checks whether or not it is positive
#' @param x any input
#' @return True or False of whether it is positive or not
is_positive <- function(x) {
  if (x > 0) {
    return(TRUE)
  }else {
    return(FALSE)
  }
}

# TRUE s
is_positive(0.01) 
is_positive(2)
# FALSE s
is_positive(-2) 
is_positive(0)


#' @title whether or not it is nonnegative
#' @description checks whether or not it is nonnegative
#' @param x any input
#' @return True or False of whether it is nonnegative or not
is_nonnegative <- function(x) {
  if (x < 0) {
    return(FALSE)
  }else {
    return(TRUE)
  }
}

# TRUE s
is_nonnegative(0) 
is_nonnegative(2)
# FALSE s
is_nonnegative(-0.00001) 
is_nonnegative(-2)


#' @title whether or not it is a positive integer
#' @description checks whether or not it is a positive integer
#' @param x any input
#' @return True or False of whether it is a positive integer or not
is_positive_integer <- function(x) {
  if (is_integer(x) & is_positive(x)) {
    return(TRUE)
  }else {
    return(FALSE)
  }
}
# TRUE
is_positive_integer(2) 
is_positive_integer(2L)
# FALSE
is_positive_integer(0) 
is_positive_integer(-2)


#' @title whether or not it is a nonnegative integer
#' @description checks whether or not it is a nonnegative integer
#' @param x any input
#' @return True or False of whether it is a nonnegative integer or not
is_nonneg_integer <- function(x) {
  if (is_integer(x) & is_nonnegative(x)) {
    return(TRUE)
  }else {
    return(FALSE)
  }
}
# TRUE s
is_nonneg_integer(0) 
is_nonneg_integer(1)
# FALSE
is_nonneg_integer(-1) 
is_nonneg_integer(-2.5)


#' @title whether or not it is a probability
#' @description checks whether or not it is a probability
#' @param p the input probability
#' @return True or False of whether it is a probability or not
is_probability <- function(p) {
  if (p >= 0 & p <= 1) {
    return(TRUE)
  }else {
    return(FALSE)
  }
}
# TRUE s
is_probability(0) 
is_probability(0.5) 
is_probability(1)
# FALSE s
is_probability(-1) 
is_probability(1.0000001)

#' @title factorial
#' @description calculates the factorial of a number
#' @param n the input number for the factorial
#' @return the factorial of n (n!)
bin_factorial <- function(n) {
  if (n == 0) {
    return(1)
  }else {
    fact = 1
    for (i in 1:n) {
      fact = fact * i
    }
    return(fact)
  }
}
bin_factorial(5)
bin_factorial(0)



#' @title n choose k
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n the total number to choose from
#' @param k the number to choose
#' @return the number of combinations 
bin_combinations <- function(n, k) {
  nu = bin_factorial(n)
  de = bin_factorial(k) * bin_factorial(n - k)
  return(nu/de)
}
bin_combinations(n = 5, k = 2) 
bin_combinations(10, 3) 
bin_combinations(4, 4)


#' @title probability of binomial
#' @description calculates the probability of binomial
#' @param trials the total trials
#' @param success the number of successes
#' @param prob the probability of a success
#' @return the probability of success in trials
bin_probability <- function(trials, success, prob) {
  
  if(!is_nonneg_integer(trials) | !is_nonneg_integer(success)) {
    stop("Both trials and success should be non-negative integer.")
  }
  if(!is_probability(prob)) {
    stop("A valid probability should be in the range of 0 <= p <= 1.")
  }

  comb = bin_combinations(trials, success)
  one_prob = (prob ^ success) * ((1 - prob) ^ (trials - success))
  return(comb * one_prob)
}
# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5) 
bin_probability(trials = 5, success = 2, prob = 0.5)



#' @title table of binomial distribution
#' @description calculates the distribution table
#' @param trials the total trials
#' @param prob the probability of a success
#' @return a distribution table
bin_distribution <- function(trials, prob) {

  success = c(0:trials)
  probability = c()
  
  for (i in 1: length(success)) {
    probability[i] = bin_probability(trials, success[i], prob)
  }
  
  dat <- data.frame(success, probability)
  
  return(dat)
}
# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)



