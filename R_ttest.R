setwd('/Users/juliankeil/Desktop/R_Matlab_common/')

data <- read.table("xydat.csv", header = FALSE, sep = ",")
results <- t.test(data$V1)
results2 <- c( results$statistic[["t"]], results$p.value )
write.table(results2, file="t_testResults.csv", sep = ",", col.names = FALSE, row.names = FALSE, qmethod = "double")