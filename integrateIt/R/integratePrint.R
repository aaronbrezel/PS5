#' Trapazoidal or Simpsons integration result print
#'
#' prints the output of a vector of x and y values integrated via the trapazoidal or simpsons method
#'
#' @param x An object of either "Trapezoid" or "Simpsons" class
#'
#' @return An object of class Trapezoid or Simpsons, the x and y vectors and the result of the integration
#'  \item{result}{The original object of class Trapazoid or Simpson}

#' @author Aaron J. Brezel
#' @note This is a very simple print function
#' @examples
#' 
#' newObject <- integrateIt(x, y, startAndEnd, rule)
#' print(newObject)
#' @rdname integratePrint


#' @export
setMethod("print", "Trapezoid", 
          function(x){
            print(x@integral)
          }
)

#' @export
setMethod("print", "Simpsons",
          function(x){
            print(x@integral)
          }
)

