library(dplyr)

#read data file
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc_t <- tbl_df(hpc)

hpc_feb <- filter(hpc,Date %in% c("1/2/2007","2/2/2007")) 
hpc_feb$DateTime <- strptime(paste(hpc_feb$Date,hpc_feb$Time),"%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))

# plot (1,1)
plot(hpc_feb$DateTime, hpc_feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

# plot (2,1)
plot(hpc_feb$DateTime, hpc_feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(hpc_feb$DateTime, hpc_feb$Sub_metering_2, col="red")
lines(hpc_feb$DateTime, hpc_feb$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (1,2)
plot(hpc_feb$DateTime, hpc_feb$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot (2, 2)
plot (hpc_feb$DateTime, hpc_feb$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()