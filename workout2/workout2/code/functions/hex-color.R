#' @title is_hex
#' @description checks whether an input is a valid hex color without an alpha transparency value
#' @param x (string)
#' @return (logical)

is_hex <- function(x) {
  if (is.character(x) == 0){
    stop("invalid input; a string was expected")
  }
  if (nchar(x) != 7) {
    return(FALSE)
  }
  a <- c('0', '1','2','3','4','5','6','7','8','9','a','b','c','d','e','f')
  x <- strsplit(tolower(x), split = "")
  if (x[[1]][1] != "#") {
    return(FALSE)
  }
  else {
    n <- c()
    for (i in 2:7){n <- c(n, x[[1]][i] %in% a)} 
    if (!("FALSE" %in% n)) {return(TRUE)}
    else {return(FALSE)}
  }
}



#' @title is_hex_alpha
#' @description checks whether an input is a valid hex color with an alpha transparency value
#' @param x (string)
#' @return (logical)

is_hex_alpha <- function(x) {
  if (is.character(x) == 0){
    stop("invalid input; a string was expected")
  }
  if (nchar(x) != 9) {
    return(FALSE)
  }
  a <- c('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f')
  x <- strsplit(tolower(x), split = "")
  if (x[[1]][1] != "#") {
    return(FALSE)
  }
  else {
    n <- c()
    for (i in 2:9){n <- c(n, x[[1]][i] %in% a)} 
    if (!("FALSE" %in% n)) {return(TRUE)}
    else {return(FALSE)}
  }
}


