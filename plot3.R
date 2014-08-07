rm(list=ls(all=TRUE)) 
BigHousehold <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

Household <- subset(BigHousehold, BigHousehold$Date == "1/2/2007" | BigHousehold$Date == "2/2/2007")

png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

Household$Date <- strptime(paste(Household$Date, Household$Time), "%d/%m/%Y %H:%M:%S")


Household$Sub_metering_1 <- as.numeric(as.character(Household$Sub_metering_1))
Household$Sub_metering_2 <- as.numeric(as.character(Household$Sub_metering_2))
Household$Sub_metering_3 <- as.numeric(as.character(Household$Sub_metering_3))


with(Household, {
       
        plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(Household$Date, Household$Sub_metering_2, col="red")
        lines(Household$Date, Household$Sub_metering_3, col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="o")
        
       
})



dev.off()
