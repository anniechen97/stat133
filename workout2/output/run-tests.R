##running tests for all four functions

library('testthat')
functions <- dir("C:\\Users\\Annie Chen\\Desktop\\stat133\\workout2\\code\\functions") 
lapply(paste0("C:\\Users\\Annie Chen\\Desktop\\stat133\\workout2\\code\\functions", functions), source)

sink(file = 'test-output.txt') 
test_dir("C:\\Users\\Annie Chen\\Desktop\\stat133\\workout2\\code\\tests") 
sink()