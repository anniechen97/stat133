#' @title count_vowels
#' @description counts vowels in both lower and upper case
#' @param x (string)
#' @return (numeric vector) with names for vowels

count_vowels <- function(x) {
  if (is.character(x)==0) {
    stop("invalid input; a string was expected")
  }
  x <- strsplit(tolower(x), split = "")[[1]]
  x <- x[x %in% vowels]
  a <- as.double(length(which(x=="a")))
  e <- as.double(length(which(x=="e")))
  i <- as.double(length(which(x=="i")))
  o <- as.double(length(which(x=="o")))
  u <- as.double(length(which(x=="u")))
  vec <- c(a, e, i, o, u)
  names(vec) <- c("a","e","i","o","u")
  return(vec)
}


             