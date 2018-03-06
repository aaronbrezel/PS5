#startAndEnd vector only has 2 values
#second value is larger than the first 
#rule must be identical to "Trap" or "Simpsons"
#An example of the simpsons integral works
#An example of the trapezoid integral works

context("Integrate it")

#test_that("The integrate it Trap method produces the correct result", {
#  expect_that(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), startAndEnd = c(1,5), rule = "Trap"), equals(list(new("Trapezoid", x = x, y = y, integral = 42), XandY = data.frame(x,y), integral = 42)))
#})

#test_that("The integrate it Simpsons method produces the correct result", {
#  expect_that(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), startAndEnd = c(1,5), rule = "Simpsons"), equals(list(new("Trapezoid", x = x, y = y, integral = 41.33333), XandY = data.frame(x,y), integral = 41.33333)))
#})

test_that("The integrate it Trap method produces the correct result", {
  expect_that(integrateIt(c(1,2,3,4,5), c(1,4,9,16,25), c(1,5), "Trap"), equals(42))
})

test_that("The integrate it Simpsons method produces the correct result", {
  expect_that(integrateIt(c(1,2,3,4,5), c(1,4,9,16,25), c(1,5), "Simpsons"), equals(41.333333333333))
})


test_that("Input is correct. The format should be integrateIt(vector,vector, vector, character)",{
  expect_error(integrateIt("p"))
  
})

test_that("Class of output is correct. We want Trapezoid",{
  expect_is(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), startAndEnd = c(1,5), rule = "Trap"), "Trapezoid")
})

test_that("Class of output is correct. We want Simpsons",{
  expect_is(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), startAndEnd = c(1,5), rule = "Simpsons"), "Simpsons")
})

# context("Print Integrate It")
# 
# test_that("The print Trap method produces the correct result", {
#   expect_that(print(new("Trapezoid", x = c(1,2,3,4,5), y = c(1,4,9,16,25), integral = 42)[[1]]), equals(42))
# })
# 
# test_that("The print Simpsons method produces the correct result", {
#   expect_that(print(new("Simpsons", x = c(1,2,3,4,5), y = c(1,4,9,16,25), integral = 41.333333333333)), equals(41.333333333333))
# })


