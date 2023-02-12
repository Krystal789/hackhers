#importing data

library(quantmod)

portfolio=read.csv(portfolio.csv)
#turn data into a data frame
data.frame = read.csv("portfolio.csv")
##turn stock code colum into a list for the loop
list.3 <- list(data.frame$x1)
##Use this retrieval to get stock information
getSymbols("ARKK", from = "2018-01-01", 
           auto.assign = F)
