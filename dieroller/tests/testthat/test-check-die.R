context("Check die arguments")
#Tests: Your package should include tests for your functions die() and roll(),
#as well as for the auxiliary functions called by them: e.g. check_sides(), check_prob(), check_times().

test_that("check the class of object 'die'", {
  expect_true(class(die())=="die")
})

test_that("check the class of object 'die'", {
  expect_false(class(die()) !="die")
})

test_that("check the class of object 'roll'", {
  expect_true(class(roll(die=die()))=="roll")
})

test_that("check the class of object 'roll'", {
  expect_false(class(roll(die=die())) !="roll")
})



test_that("check_sides with ok vectors", {
  expect_true(check_sides(c('a', 'b', 'c', 'd', 'e', 'f')))
  expect_true(check_sides(c(1, 2, 3, 4, 5, 6)))
})

test_that("check_sides fails with invalid lengths", {
  expect_error(check_sides(c('a', 'b', 'c')))
  expect_error(check_sides(c('a')))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
})




test_that("check_prob works with ok vectors", {
  expect_true(check_prob(c(0, 0, 0, 0, 0, 1)))
  expect_true(check_prob(c(1, 0, 0, 0, 0, 0)))
  expect_true(check_prob(c(0.1, 0.3, 0.2, 0.1, 0.1, 0.2)))
  expect_true(check_prob(c(1/3, 1/3, 0, 1/6, 1/6, 0)))
  expect_true(check_prob(c(1/6, 1/6, 1/12, 3/12, 1/6, 1/6)))
})

test_that("check_prob fails with invalid lengths", {
  expect_error(check_prob(1:5))
  expect_error(check_prob(1))
})

test_that("check_prob fails with invalid numbers", {
  expect_error(check_prob(0.333, 0.222, 0.111, 0.111, 0.111, 0.111))
  expect_error(check_prob(-0.5, 0.5, 0, 0, 0, 0))
  expect_error(check_prob(0.5, -0.5, 0, 0, 0, 0))
  expect_error(check_prob(0.5, NA, NA, NA, NA, NA))
})



test_that("check_times works with ok number", {
  expect_true(check_times(3))
  expect_true(check_times(50))
  expect_true(check_times(100))
})

test_that("check_tiems fails with invalid number", {
  expect_error(check_times(-2))
  expect_error(check_times(-9.8))
  expect_error(check_times("a"))
})

