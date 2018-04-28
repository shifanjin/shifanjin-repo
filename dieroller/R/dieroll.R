

##################################################################################### Object die
#' @title Die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of side probabilities
#' @return an object of class \code{"die"}
#' @seealso \code{\link{roll}}
#' @export
#' @examples
#' # default call: creates a standard fair die
#' fair_die <- die()
#' fair_die
#'
#' # die with non-standard sides
#' weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
#' weird_die
#'
#' # create a loaded die
#' loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#' loaded_die
#'
die <- function(sides = c(1, 2, 3, 4, 5, 6), prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)) {

  check_sides(sides)
  check_prob(prob)

  obj = list(sides = sides, prob = prob)
  class(obj) = "die"

  return(obj)
}


# private function to check vector of sides
check_sides <- function(sides) {

  if (length(sides) != 6) {
    stop("\n'sides' must be a vector of length 6")
  }

  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }

  TRUE
}

# private function to check vector of probabilities
check_prob <- function(prob) {

  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n 'prob' must be a numeric vector of length 6")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }

  TRUE
}

#' @export
print.die <- function(die) {
  cat('object "die"\n\n')

  die_df <- data.frame(
    side = die$sides,
    prob = die$prob
  )
  print(die_df)
  invisible(die)

}

##################################################################################### Object roll
#' @title Roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of die \code{"sides"}}
#' @return \item{prob}{vector of die \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export
#' @examples
#' fair_die <- die()
#' set.seed(123)
#' fair50 <- roll(fair_die, times = 50)
#' fair50
#'
#' # roll fair die 50 times
#' fair_die <- die()
#' # roll 50 times
#' set.seed(123)
#' fair_50rolls <- roll(fair_die, times = 50)
#' # print
#' fair_50rolls
#'
#' # what's in fair50?
#' names(fair50)
#'
#' fair50$rolls
#' fair50$sides
#' fair50$prob
#' fair50$total
#'
#' # string die
#' str_die <- die(sides = c('a', 'b', 'c', 'd', 'e', 'f'), prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#'
#' # roll 20 times
#' set.seed(123)
#' str_rolls <- roll(str_die, times = 20)
#' names(str_rolls)
#' str_rolls
roll <- function(die, times = 1) {
  check_times(times)
  rolls_output = sample(x = die$sides, size = times, replace = TRUE, prob = die$prob)

  obj = list (
    rolls = rolls_output,
    sides = die$sides,
    prob = die$prob,
    total = times
  )

  class(obj) = "roll"

  return(obj)
}

# private function to check vector of 'times'
check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\n'times' must be a positive number")
  }

  TRUE
}


#' @export
print.roll <- function(roll) {

  cat('object "roll"\n\n')
  cat('$rolls\n')
  print(roll$rolls)
  invisible(roll)
}


#' @export
summary.roll <- function(roll) {

  count <- c(
    sum(roll$rolls == roll$sides[1]),
    sum(roll$rolls == roll$sides[2]),
    sum(roll$rolls == roll$sides[3]),
    sum(roll$rolls == roll$sides[4]),
    sum(roll$rolls == roll$sides[5]),
    sum(roll$rolls == roll$sides[6])
  )

  prob <- count / roll$total

  freqs <- data.frame(
    side = roll$sides,
    count = count,
    prob = prob
  )

  obj = list(freqs = freqs)
  class(obj) = "summary.roll"

  return(obj)
}


#' @export
print.summary.roll <- function(obj) {
  cat('summary "roll"\n\n')
  print(obj$freqs)
  invisible(obj)
}



##################################################################################### Plot roll
#' @title Plot of object roll
#' @description Plots the relative frequencies of a series of rolls
#' @param roll an object of class \code{"roll"}
#' @param \dots arguments to be passed to/from other methods
#' @export
#' @examples
#'  \dontrun{
#'  #plot method
#'  plot(fair_50rolls)
#'
#'  #plot method
#'  plot(fair500, 500)
#'
#'  }
plot.roll <- function(roll, ...) {

  main = paste("Frequencies in the series of", roll$total, "die rolls")

  barplot(table(roll$rolls) / roll$total,
          main = main, xlab = "sides of die", ylab = "relative frequencies")
}


##################################################################################### Additional Methods
#' @export
"[.roll" <- function(roll, i) {

  if(i <= 0 | i > length(roll$rolls)) {
    stop("\nInvalid index for extraction")
  }

  return(roll$rolls[i])

}


#' @export
"[<-.roll" <- function(roll, i, value) {
  if (any(roll$sides == value) == FALSE) {
    stop("\nReplacing value must be one of the sides")
  }

  roll$rolls[i] = value
  return(roll)
}


#' @export
"+.roll" <- function(roll, incr) {

  if(length(incr) != 1 | incr <= 0) {
    stop("\nInvalid increament (must be positive)")
  }

  x_die <- die(roll$sides, roll$prob)
  more_roll = roll(x_die, times = incr)
  roll$rolls = c(roll$rolls, more_roll$rolls)
  roll$sides = roll$sides
  roll$prob = roll$prob
  roll$total = roll$total + incr

  return(roll)

}
