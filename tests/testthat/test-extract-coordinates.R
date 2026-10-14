test_that("single numbers handled", {

  expect_equal(extract_coordinates("1"), list("start" = 1,
                                              "end"= NA_real_))

  expect_equal(extract_coordinates("123456789"), list("start" = 123456789,
                                              "end"= NA_real_))

})

test_that("small coordinate pairs handled", {

  expect_equal(extract_coordinates("1..3"), list("start" = 1,
                                                 "end"= 3))

})

test_that("large coordinate pairs handled", {

  expect_equal(extract_coordinates("123456789..234567890"),
               list("start" = 123456789,
                    "end"= 234567890))

})

test_that("different separators handled", {

  # Space
  expect_equal(extract_coordinates("123456789 234567890"),
               list("start" = 123456789,
                    "end"= 234567890))

  # Colon
  expect_equal(extract_coordinates("123456789:234567890"),
               list("start" = 123456789,
                    "end"= 234567890))

  # ^
  expect_equal(extract_coordinates("123456789^234567890"),
               list("start" = 123456789,
                    "end"= 234567890))

})

test_that("complement format handled", {

  expect_equal(extract_coordinates("complement(123456789..234567890)"),
               list("start" = 123456789,
                    "end"= 234567890))

})

test_that("input over 9 digits long produces error", {
  expect_error(extract_coordinates("1234567890..1234"),
               "Input contains numbers more than 9 digits long. Chromosome coordinates should not be this long: 1234567890")
})

test_that("argument checking works", {

  expect_error(extract_coordinates(1234),
               "x must be a string")

  expect_error(extract_coordinates(""),
               "x must not be empty or contain only whitespace")

})
