library(dplyr)
getwd()
#read data file
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc_table <- tbl_df(hpc)

hpc_feb <- filter(hpc,Date %in% c("1/2/2007","2/2/2007")) 
hpc_feb$DateTime <- strptime(paste(hpc_feb$Date,hpc_feb$Time),"%d/%m/%Y %H:%M:%S")
png("plot3.png",width=480,height=480)

plot(hpc_feb$DateTime, hpc_feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(hpc_feb$DateTime, hpc_feb$Sub_metering_2, col="red")
lines(hpc_feb$DateTime, hpc_feb$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()