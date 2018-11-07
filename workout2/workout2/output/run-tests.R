##running tests for all four functions

library('testthat')
functions <- dir('../code/functions') 
lapply(paste0('../code/functions/', functions), source)

sink(file = 'test-output.txt') 
test_dir('../code/tests') 
sink()
