context("Check device arguments")

test_that("check_sides with ok vectors", {
  
  expect_true(check_sides(c('i', 'ii', 'iii', 'iv')))
})


test_that("check_sides fails with invalid lengths", {
  
  expect_error(check_sides(c('a')))
  TRUE
})


test_that("check_prob works with ok vectors", {
  
  expect_true(check_prob(c(0.5, 0.5)))
  expect_true(check_prob(c(0, 1)))
  expect_true(check_prob(c(0.1, 0.9)))
  expect_true(check_prob(c(1/3, 2/3)))
})


test_that("check_prob fails with invalid lengths", {
  
  expect_error(check_prob(1:5))
})

