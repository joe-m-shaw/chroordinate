test_that("numeric inputs is handled", {

  expect_true(is.factor(factorise_chromosome(c(1, 2, 3))))

})

test_that("text inputs is handled", {

  expect_true(is.factor(factorise_chromosome(c("1", "2", "3", "X"))))

})

test_that("non-standard inputs give warning", {

  expect_warning(factorise_chromosome(c("1", "2", "X", "Z")),
                 "NAs introduced because some chromosomes are not as expected: Z")

})

test_that("decimals give warning", {

  expect_warning(factorise_chromosome(c("1.0", "2", "X")),
                 "NAs introduced because some chromosomes are not as expected: 1.0")

})

test_that("empty string gives error", {

  expect_error(factorise_chromosome(""),
               "input must not be empty or contain only whitespace")

})
