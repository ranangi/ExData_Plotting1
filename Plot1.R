library(dplyr);
#read data file
#working directory
getwd()
#read the data file
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
#data frame
hpc_table <- tbl_df(hpc)
#check data frame
print(tbl_df(hpc), n=2)

hpc_table_feb <- filter(hpc_table,Date %in% c("1/2/2007","2/2/2007")) 
png("plot1.png",width=480,height=480)

hist(hpc_table_feb$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()