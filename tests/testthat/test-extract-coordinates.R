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
