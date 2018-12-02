#' @title Plot of object roll
#' @description Plots the relative frequencies of a series of rolls
#' @param x an object of class 
#' @param \dots arguments to be passed to/from other methods
#' @export
plot.rolls <- function(x, ...) {
  barplot(table(x$rolls)/length(x$rolls),
          main = 'Relative Frequencies in a Series of 50 Rolls',
          xlab = 'Sides of Device',
          ylab = 'Relative Frequencies')
}