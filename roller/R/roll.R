#private function to check vector of 'times'
check_times <- function(times) {
  if (times < 1) {
    stop("times should be greater or equal to 1")
  }
  TRUE
}
#private function
draw <- function(x,times=1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}
#private function
make_draw <- function(x, draws) {
  rolls = draws
  sides = x$sides
  prob = x$prob
  total = draws
  res <- list(rolls=rolls, sides=sides, prob=prob, total=total)
  class(res) <- "rolls"
  res
}
#' @title roll
#' @description Simulates rolling a device a given number of times
#' @param x device object (a vector)
#' @param times number of rolls
#' @param prob vector of probabilities for each side of the device
#' @return vector of rolls
#' #' @export
roll <- function(x, times=1){
  if (class(x) != "device") {
    stop("roll() requires an objec 'device'")
  }
  check_times(times)
  draws <- draw(x, times=times)
  make_draw(x, draws)
}
#' @export
#print method
print.rolls <- function(x,...) {
  cat('object "roll"\n\n')
  cat('"$rolls"\n')
  print(x$rolls)
}
#' @export
#summary function
summary.rolls <- function(x, ...) {
  freqs <- data.frame(
    side = x$sides,
    count = as.numeric(table(x$rolls)),
    prop = as.numeric(table(x$rolls))/sum(table(x$rolls))
  )
  obj <- list(freqs = freqs)
  class(obj) <- "summary.roll"
  obj
}
#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}



#' @export
"[<-.rolls" <- function(x, i, value) {
  if (sum(value==x$sides)==0) {
    stop(sprintf('\nreplacing value must be %s or %s', x$device$sides[1], x$sides$device[2]))
  }
  x$rolls[i] <- value
  make_draw(x$device, x$rolls)
}

#' @export
"[.rolls" <- function(x, i) {
  return(x$rolls[i])
}

#' @export
"+.rolls" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increment")
  }
  more_draws <- draw(obj$device, times = incr)
  make_draw(obj$device, c(obj$rolls, more_draws))
}


#' @rdname roll
#' @param x an R object
#' @export
is.roll <- function(x) {
  inherits(x, "roll")
}
#' @rdname roll
#' @export
as.roll <- function(x) {
  x_device <- device(unique(x))
  make_roll(x_device, x)
}


