test_that("single numbers handled", {

  expect_equal(extract_coordinate("1"), 1)

  expect_equal(extract_coordinate("123456789"), 123456789)

})


test_that("small coordinate pairs handled", {

  expect_equal(extract_coordinate("1..3"), 1)

  expect_equal(extract_coordinate("1..3",
                                  location = "end"), 3)

})

test_that("large coordinate pairs handled", {

  expect_equal(extract_coordinate("123456789..234567890"), 123456789)

  expect_equal(extract_coordinate("123456789..234567890",
                                  location = "end"), 234567890)

})

test_that("different separators handled", {

  # Space
  expect_equal(extract_coordinate("123456789 234567890"), 123456789)
  expect_equal(extract_coordinate("123456789 234567890",
                                  location = "end"), 234567890)

  # Colon
  expect_equal(extract_coordinate("123456789:234567890"), 123456789)
  expect_equal(extract_coordinate("123456789:234567890",
                                  location = "end"), 234567890)

  # ^
  expect_equal(extract_coordinate("123456789^234567890"), 123456789)
  expect_equal(extract_coordinate("123456789^234567890",
                                  location = "end"), 234567890)

})

test_that("complement format handled", {

  expect_equal(extract_coordinate("complement(123456789..234567890)"),
                                  123456789)

  expect_equal(extract_coordinate("complement(123456789..234567890)",
                                  location = "end"), 234567890)

})

test_that("type argument works when character is specified", {

  expect_equal(extract_coordinate("1",
                                  type = "character"), "1")

  expect_equal(extract_coordinate("123456789..234567890",
                                  type = "character"), "123456789")

})

test_that("vector input handled", {

  expect_equal(extract_coordinate(c("1", "123456789..234567890", "12345^23456")),
               c(1, 123456789, 12345))

})

test_that("non text inputs generate error", {

  expect_error(extract_coordinate(x = 1237),
               "input must be a string")

  expect_error(extract_coordinate(x = ""),
               "input must not be empty or contain only whitespace")

  expect_error(extract_coordinate(x = c("123", NA)),
               "input must not contain NA values")

})

test_that("error thrown if start or end not used", {

  expect_error(extract_coordinate("123456789..234567890",
                                  location = "stop"),
               "location must be start or end")

})
