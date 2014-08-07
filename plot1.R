rm(list=ls(all=TRUE)) 
BigHousehold <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

Household <- subset(BigHousehold, BigHousehold$Date == "1/2/2007" | BigHousehold$Date == "2/2/2007")

png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

Household$Global_active_power <- as.numeric(as.character(Household$Global_active_power))

hist(Household$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
