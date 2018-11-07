#' @title reverse_chars
#' @description reverse a string by characers
#' @param x (string)
#' @return (string) in reverse

reverse_chars <- function(string) {
  split <- strsplit(string, split = "")
  order <- nchar(string):1
  rev <- split[[1]][order]
  paste(rev, collapse = "")
} 


