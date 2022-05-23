test_that("doesn't throw an error and returns the same", {
  df <- data.frame(a=rnorm(100), b=1:100)
  expect_identical(df, flyDN(df))
})
