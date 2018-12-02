#private function to check sides
check_sides <- function(sides) {
  if (is.vector(sides)==0) {
    stop("sides must be a vector")
  }
  if (length(sides) < 2) {
    stop("sides must be more than 1")
  }
  TRUE
}
#private function to check probability
check_prob <- function(prob) {
  if (is.numeric(prob)==0) {
    stop("prob must be numeric")
  }
  if (sum(prob) != 1) {
    stop("sum of the probabilities must be 1")
  }
  TRUE
}
#' @title device
#' @description Creates an object of class
#' @param sides vector of sides
#' @param prob vector of side probabilities
#' @return an object of class
#' @export
device <- function(sides = c(1,2), prob = c(0.5,0.5)){
  check_sides(sides)
  check_prob(prob)

  if (length(sides) != length(prob)) {
    stop("the length of sides and probability must be equal")
  }

  object <-list(sides=sides, prob=prob)
  class(object) <- "device"
  return(object)
}
#' @export
print.device <- function(x) {
  cat('object "device"\n\n')
  cd <- data.frame(side = x$sides, prob = x$prob)
  print(cd)
  invisible(x)
}
#check device
is.device <- function(x) {
  is(x, "device")
}

