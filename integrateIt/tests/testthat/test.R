context("Adding squares")

test_that("squares add correctly", {
  expect_that(addSquares(2,3), equals(new("Squares", square=(13), x = 2, y = 3)))
  expect_that(addSquares(2,2), equals(new("Squares", square=(8), x = 2, y = 2)))
})

test_that("Input is correct. No characters or stuff like that",{
  expect_error(addSquares("p"))
  
})

test_that("Class of output is correct. We want Squares",{
  expect_is(addSquares(1,2), "Squares")
})


context("Subtracting squares")

test_that("squares subtract correctly", {
  expect_that(subtractSquares(9,2), equals(new("Squares", square=(77), x = 9, y = 2)))
  expect_that(subtractSquares(2,2), equals(new("Squares", square=(0), x = 2, y = 2)))
})

test_that("Input is correct. No characters or stuff like that",{
  expect_error(subtractSquares("p"))
  
})

test_that("Class of output is correct. We want Squares",{
  expect_is(subtractSquares(1,2), "Squares")
})

context("Multiply squares")

test_that("squares subtract correctly", {
  expect_that(multiplySquares(4,2), equals(new("Squares", square=(64), x = 4, y = 2)))
  expect_that(multiplySquares(2,2), equals(new("Squares", square=(16), x = 2, y = 2)))
})

test_that("Input is correct. No characters or stuff like that",{
  expect_error(multiplySquares("p"))
  
})

test_that("Class of output is correct. We want Squares",{
  expect_is(multiplySquares(1,2), "Squares")
})