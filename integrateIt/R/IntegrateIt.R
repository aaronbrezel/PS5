#' A Trapezoidal or Simpsons integration object 
#' 
#' Object of class \code{integrateIt} are created by the \code{integrateIt} functions
#'
#' 
#' An object of the class `integrateIt' has the following slots:
#' \itemize{
#' \item \code{x} The vector of x values
#' \item \code{y} The vector of corresponding y values
#' \item \code{startAndEnd} The length = 2 vector of the start and end "x" values of the itegration
#' \item \code{rule} A string value, either "Trap" or "Simpsons" to indicate which integration should be performed
#' }
#'
#' @author Aaron J. Brezel: \email{aaronbrezel@@wustl.edu}
#What are aliases and are they useful?
#' @aliases Squares-class initialize,Squares-method getSquares,Squares-method 
#' @rdname TrapAndSimpsons
#' @export
setClass(Class="Trapazoid", 
         representation = representation(
           x = "numeric",
           y = "numeric",
           startAndEnd = "numeric",
           rule = "character"
         ),
         prototype = prototype(
           square = c(),
           x = c(),
           y = c(),
           rule = c()
         )
)

#' @export
setClass(Class="Simpsons", 
         representation = representation(
           x = "numeric",
           y = "numeric",
           startAndEnd = "numeric",
           rule = "string"
         ),
         prototype = prototype(
           square = c(),
           x = c(),
           y = c(),
           rule = c()
         )
)

#' @export
setMethod("initialize", "Trapazoid", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setMethod("initialize", "Simpsons", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 

