#' @title count_vowels
#' @description counts vowels in both lower and upper case
#' @param x (string)
#' @return (numeric vector) with names for vowels

count_vowels <- function(x) {
  if (is.character(x)==0) {
    stop("invalid input; a string was expected")
  }
  x <- tolower(strsplit(x, split = "")[[1]])
  x<- x[x %in% vowels]
  table(x)
}

