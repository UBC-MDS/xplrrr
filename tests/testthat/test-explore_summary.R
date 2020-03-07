test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("Output is well-formed",{
  data <- data.frame("SN" = 1:5, "Name" = c("John", "Dora", "Bob", "Alice", "Lucy"),
                     "ID"=c("281","125","200","316","293"),"Age" = c(NaN,15,20,36,23))
  expect_equal(nrow(explore_summary(data)), 2)
  expect_equal(ncol(explore_summary(data)), 7)
})
