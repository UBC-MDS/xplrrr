test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("Check number of outliers", {
  df = data.frame('col1'= c(1, 2, 1.00, 3, -1, 100),
                  'col2'= c(3, 1 ,3, -2, 3, -1))
  results = explore_outliers(df)

  expect_identical(results$outlier_count[1], 1)
  expect_identical(results$outlier_count[2], 0)
})