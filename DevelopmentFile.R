
## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("C:/Users/aaron/OneDrive/Documents/Applied Statistical Programming/PS5") #This will need to be changed to match your directory

# Now the NAMESPACE

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)
test(current.code)

#Test code
x <- c(1,2,3,4,5)
y <- c(1,4,9,16,25)

startAndEnd <- c(1,5)
integrateIt(x,y, startAndEnd, "Trap")
output <- integrateIt(x,y, startAndEnd, "Trap")
print(output)
print(integrateIt(x,y, startAndEnd, "Trap"))



