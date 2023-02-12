library(readxl)
#below made the file into a data frame
transactions <- read_excel("coding proj/HackHers 2023/transactions.xlsx")
View(transactions)

#above imports the data

#clean it, assume the currency is USD
  #remove the time column
transactions[ ,!names(trasactions %in% c("Time", "time"))]

monthly_transac = data.frame(matrix(ncol = 3, nrow = 0))
colnames(monthly_transac) = c('year', 'month', 'closing balance')


# ---iterate through the transactions
# ------categorize transactions into monthly, just use the last balance for each month

#function to extract end date entries
find_end = function(entry){
  temp = data.frame()
  for(elem in NROW(entry):1){
    print(elem)
    if(format(entry[elem]$Date, "%m") = format(entry[elem - 1]$Date, "%m")){
      if (format(entry[elem]$Date, "%m") > format(entry[elem - 1]$Date, "%m")){
        temp[1, ] = entry[elem]
      }
      else{
        next
      }
    }
    else{
      temp[1, ] = entry[elem + 1]
      insert into data frame
    }
  }
}

#make a variable that is the starting amount as reference

#determine the compound growth rate




#now we find the monthly data

