library(dplyr)

#reasd the data file

hpc  <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc_tbl <- tbl_df(hpc )
#filter

hpc_feb <- filter(hpc ,Date %in% c("1/2/2007","2/2/2007")) 

hpc_feb$DateTime <- strptime(paste(hpc_feb$Date,hpc_feb$Time),"%d/%m/%Y %H:%M:%S")

png("plot2.png",width=480,height=480)

plot(hpc_feb$DateTime, hpc_feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

dev.off()



