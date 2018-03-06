#' A Trapezoidal or Simpsons integration object 
#' 
#' Object of class \code{integrateIt} are created by the \code{integrateIt} functions
#'
#' 
#' An object of the class "Trapezoid" or "Simpsons" has the following slots:
#' \itemize{
#' \item \code{x} The vector of x values
#' \item \code{y} The vector of corresponding y values
#' \item \code{integral} The result of the integral calculation of the x and y vectors 
#' }
#'
#' @author Aaron J. Brezel: \email{aaronbrezel@@wustl.edu}
#' @rdname TrapAndSimpsons
#' @export
setClass(Class="Trapezoid", 
         representation = representation(
           x = "numeric",
           y = "numeric",
           integral = "numeric"
         ),
         prototype = prototype(
           x = c(),
           y = c(),
           integral = c()
         )
)

#' @export
setClass(Class="Simpsons", 
         representation = representation(
           x = "numeric",
           y = "numeric",
           integral = "numeric"
         ),
         prototype = prototype(
           x = c(),
           y = c(),
           integral = c()
         )
)

#' @export
setMethod("initialize", "Trapezoid", 
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

#' @export
setValidity("Trapezoid", function(object){
  if(length(object@x) == 1){
    return("Yo, you can't take an integral with one value")
  }
  else if(!identical(length(object@x), length(object@y))){ #x and y need to have an identical length to correspond correctly
    return("Yo, vectors x and y must have identical lengths")
  }
  #else if(length(object@x) %% 2 != 0){
  #  return("Yo, went doing a trapezoidal integration, x must have an even number of vectors")
  #}
})

setValidity("Simpsons", function(object){
  if(length(object@x) == 1){
    return("Yo, you can't take an integral with one value")
  }
  else if(!identical(length(object@x), length(object@y))){ #x and y need to have an identical length to correspond correctly
    return("Yo, vectors x and y must have identical lengths")
  }
  else if(length(object@x) %% 2 != 1){
    return("Yo, went doing a simpsons integration, x must have an odd number of vectors")
  }
  
})

