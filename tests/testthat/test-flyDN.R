test_that("returns the same dataframe", {
  df <- data.frame(a=rnorm(100), b=1:100)
  expect_identical(df, flyDN(df))
})
