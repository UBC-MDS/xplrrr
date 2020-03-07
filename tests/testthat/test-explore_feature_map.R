test_that("Check input dataframe type", {
  expect_error(explore_feature_map(1), "Invalid dataframe specified", fixed=TRUE)
})

test_that("Check empty dataframe", {
  expect_error(explore_feature_map(data.frame()), "Dataframe is empty", fixed=TRUE)
})

test_that("Check empty dataframe", {
  expect_error(explore_feature_map(iris %>% select('Species')), "No numeric columns present in the dataframe", fixed=TRUE)
})
