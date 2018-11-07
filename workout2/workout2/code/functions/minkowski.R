#' @title minkowski
#' @description calculates the minkowski distance between two points
#' @param x (numeric vector)
#' @param y (numeric vector)
#' @param p (numeric)
#' @return distance (numeric)


minkowski <- function(x, y, p) {
  if (length(x) != length(y)) {
    stop( "x and y have different lengths")
  }
  if (is.numeric(p)) {
    if (p < 1) {
      stop("p cannot be less than 1")
    }
    else {
      sum = 0
      for (i in 1:length(x)) {
        sum <- sum + (abs(x[i]-y[i]))^p
        dis <- (sum)^(1/p)
      }
    }
  }
  if (is.character(p)) {
    if (p != "max") {
      stop("invalid character value for p")
    }
    else {
      dis = 1
    }
  }
  return(dis) 
}


