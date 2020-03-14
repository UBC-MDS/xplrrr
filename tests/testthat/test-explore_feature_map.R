library(tidyverse)

test_that("Check input dataframe type", {
  expect_error(explore_feature_map(1), "Invalid dataframe specified", fixed=TRUE)
})

test_that("Check empty dataframe", {
  expect_error(explore_feature_map(data.frame()), "Dataframe is empty", fixed=TRUE)
})

test_that("Check empty no numeric columns", {
  expect_error(explore_feature_map(iris %>% select('Species')), "No numeric columns present in the dataframe", fixed=TRUE)
})

test_that("Check return plot structure", {
  p <- explore_feature_map(iris)
  expect_is(p, 'gtable') # is Ggplot object
  expect_equal(length(p[[4]]), 5) # X axis
  expect_equal(length(p[[3]]), 5) # Y axis
})
