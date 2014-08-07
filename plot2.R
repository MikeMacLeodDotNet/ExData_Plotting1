rm(list=ls(all=TRUE)) 
BigHousehold <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

Household <- subset(BigHousehold, BigHousehold$Date == "1/2/2007" | BigHousehold$Date == "2/2/2007")

png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

Household$Date <- strptime(paste(Household$Date, Household$Time), "%d/%m/%Y %H:%M:%S")

Household$Global_active_power <- as.numeric(as.character(Household$Global_active_power))

with(Household, {
        plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
                
})



dev.off()
