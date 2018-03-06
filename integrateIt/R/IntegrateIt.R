#' Trapazoidal or Simpsons integration
#'
#' Integrates two vectors of "x" and "y" values via the Trapazoid or Simpsons method
#'
#' @param x The vector of x values
#' @param y The vector of corresponding y values with the same dimensionality as \code{x}.
#' @param startAndEnd The length = 2 vector of the start and end "x" values of the itegration
#' @param rule A string value, either "Trap" or "Simpsons" to indicate which integration should be performed
#'
#' @return An object of class Trapazoid or Simpsons, the x and y vectors and the result of the integration
#'  \item{object}{The original object of class Trapazoid or Simpson}
#'  \item{XandY}{A factor containing the x and y vectors}
#'  \item{result}{The result of the integration} 
#' @author Aaron J. Brezel
#' @note This is a very complicated function function
#' @examples
#' 
#' x <- c(1,2,3,4,5) 
#' y <- c(1,4,9,16,25)
#' startAndEnd <- c(1,5)
#' rule <- "Trap"
#' integrateIt(x, y, startAndEnd, rule)
#' @rdname integrateIt

#' @export
setGeneric(name="integrateIt",
           def=function(x, y, startAndEnd, rule)
           {standardGeneric("integrateIt")}
)

#' @export
setMethod(f="integrateIt",
          definition=function(x, y, startAndEnd, rule){
            h <- (max(x) - min(x))/(length(x)-1)
            XandY <- data.frame(x,y)
            if(length(startAndEnd) != 2){# startAndEnd must only have two values as they are the start and end points of the integrals 
              return("Yo, your startAndEnd vector must only contain two values")
            }
            else if(startAndEnd[1] > startAndEnd[2]){# The first value of startAndEnd must be smaller than the second 
              return("Yo, the second value of startAndEnd must be larger than the first ")
            }
            else if(!is.element(startAndEnd[1],x) || !is.element(startAndEnd[2],x)){# Both values of startAndEnd must be within x 
              return("Yo, both values of startAndEnd must be included in x")
            }
            else if(identical(rule, "Trap")){
              y[1] <- y[1]/2
              y[length(y)] <- y[length(y)]/2
              integral = sum(y)*h
              newObject <- new("Trapezoid", x = x, y = y, integral = integral)
              return(list(newObject, XandY, integral))
            }
            else if(identical(rule, "Simpsons")){
              newY <- y[-c(1, length(y))]
              #creates indices of odd and even indices in newY 
              even_indices <- seq(2, length(newY), 2)
              odd_indices <- seq(1, length(newY), 2)
              2*newY[c(even_indices)]
              4*newY[c(odd_indices)]
              integral <- (h/3)*(sum(y[1], 4*newY[c(odd_indices)], 2*newY[c(even_indices)], y[length(y)]))
              newObject <- new("Simpsons", x = x, y = y,integral = integral)
              return(list(newObject, XandY, integral))
            }
            else{
              return("rule must be a character string either 'Trap' or 'Simpsons'")
            }
          }
)


