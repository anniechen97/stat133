#' @title is_hex
#' @description checks whether an input is a valid hex color without an alpha transparency value
#' @param x (string)
#' @return (logical)

is_hex <- function(x) {
  if (is.character(x) == 0){
    stop("invalid input; a string was expected")
  }
  x <- tolower(x)
  if (substr(x, 1, 1) != "#") {
    return(FALSE)
  }
  
  
}

#' @title is_hex
#' @description checks whether an input is a valid hex color with an alpha transparency value
#' @param x (string)
#' @return (logical)


