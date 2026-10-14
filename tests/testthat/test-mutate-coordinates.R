test_that("dataframe with single and paired coordinate formats handled correctly", {

  test_df <- tibble::tribble(
    ~"region",
    "1",
    "1..3",
    "123456789..234567890"
    )

  expected_df <- tibble::tribble(
    ~"region", ~"start", ~"end",
    "1", 1, NA,
    "1..3", 1, 3,
    "123456789..234567890", 123456789, 234567890
    )

    expect_equal(mutate_coordinates(df = test_df,
                                    coord_col = region),
                 expected_df)

})

test_that("dataframe with different separators is handled correctly", {

  test_df <-  tibble::tribble(
    ~"region",
    "12346789_23457890",
    "12345-23456",
    "3456789 23456",
    "123456^234567",
    "123456789:234567890")

  expected_df <- tibble::tribble(
    ~"region", ~"start", ~"end",
    "12346789_23457890", 12346789, 23457890,
    "12345-23456", 12345, 23456,
    "3456789 23456", 3456789, 23456,
    "123456^234567", 123456, 234567,
    "123456789:234567890", 123456789, 234567890)

  expect_equal(mutate_coordinates(df = test_df,
                                  coord_col = region),
               expected_df)

})

test_that("additional text is handled correctly", {

  test_df <-  tibble::tribble(
    ~"region",
    "complement(21968224..21995324)",
    "21968224..21995324",
    "start:21968224; end: 21995324")

  expected_df <- tibble::tribble(
    ~"region", ~"start", ~"end",
    "complement(21968224..21995324)", 21968224, 21995324,
    "21968224..21995324", 21968224, 21995324,
    "start:21968224; end: 21995324", 21968224, 21995324)

    expect_equal(mutate_coordinates(df = test_df,
                                    coord_col = region),
                 expected_df)

})
