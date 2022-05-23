test_that("returns the same dataframe", {
  df <- data.frame(a=rnorm(100), b=1:100)
  expect_equal(df, flyDN(df))
})
