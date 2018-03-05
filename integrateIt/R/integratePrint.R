#' Trapazoidal or Simpsons integration result print
#'
#' prints the output of a vector of x and y values integrated via the trapazoidal or simpsons method
#'
#' @param object An object of either "Trapazoid" or "Simpsons" class
#'
#' @return An object of class Trapazoid or Simpsons, the x and y vectors and the result of the integration
#'  \item{result}{The original object of class Trapazoid or Simpson}

#' @author Aaron J. Brezel
#' @note This is a very simple print function
#' @examples
#' 
#' x <- c(1,2,3,4,5) 
#' y <- c(1,4,9,16,25)
#' startAndEnd <- c(1,5)
#' rule <- "Trap"
#' integrateIt(x, y, startAndEnd, rule)
#' @rdname integratePrint


#' @export
setMethod(f="print",
          definition=function(object){
            h <- (max(x) - min(x))/(length(x)-1)
            XandY <- data.frame(x,y)
            if(identical(rule, "Trap")){
              y[1] <- y[1]/2
              y[length(y)] <- y[length(y)]/2
              integral = sum(y)*h
              newObject <- new("Trapazoid", x = x, y = y, startAndEnd = startAndEnd, rule = rule, integral = integral)
              return(list(newObject, XandY, integral))
            }
            else if(identical(trapOrSimpsons, "Simpsons")){
              newY <- y[-c(1, length(y))]
              #creates indices of odd and even indices in newY 
              even_indices <- seq(2, length(newY), 2)
              odd_indices <- seq(1, length(newY), 2)
              2*newY[c(even_indices)]
              4*newY[c(odd_indices)]
              integral <- (h/3)*(sum(y[1], 4*newY[c(odd_indices)], 2*newY[c(even_indices)], y[length(y)]))
              newObject <- new("Simpsons", x = x, y = y, startAndEnd = startAndEnd, rule = rule, integral = integral)
              return(list(newObject, XandY, integral))
            }
            else{
              return("rule must be a character string either 'Trap' or 'Simpsons'")
            }
          }
)



