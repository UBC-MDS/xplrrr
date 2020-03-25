test_explore_missing <- function() {

  test_1 <- data.frame('col1' = c(1, 2, NA, 4, 5, 6, 7, 8, 9, 10),
                       'col2' = c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
                       'col3' = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                       'col4' = c('one', 'two', 'three', 'four', 'five', 'six', 'seven', NA, NA, 'ten'))

  test_2 <- test_1[c('col2', 'col3')]
  test_3 <- test_1['col1']

  test_that("Test the lengths", {
    expect_equal(dim(explore_missing(test_1, 0))[1], 3)
    expect_equal(dim(explore_missing(test_1, 1))[1], 7)
    expect_equal(dim(explore_missing(test_1, 2))[1], 10)
    expect_equal(dim(explore_missing(test_1, 30))[1], 10)
  })

  test_that('Test type = "count"', {
    expect_equal(explore_missing(test_1, type = "count")[1,1], 1)
    expect_equal(explore_missing(test_1, type = "count")[1,2], 0.1)
  })

  test_that("Test value error", {
    expect_error(explore_missing(test_2), "There are no missing values in the dataframe")
  })

  test_that("Test type_1 error", {
    expect_error(explore_missing(test_1, -5), "num_rows must be a positive integer")
  })

  test_that("Test type_2 error", {
    expect_error(explore_missing(test_1, "three"), "num_rows must be a valid integer")
  })

  test_that("Test type_3 error", {
    expect_error(explore_missing(list(test_1)), "incorrect number of dimensions")
  })

  test_that("Test name error", {
    expect_error(explore_missing(test_1, type = "loc"), 'Type must be either "count" or "location"')
  })

}

test_explore_missing()
