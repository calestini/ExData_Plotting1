#plot3.r
        mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset to 02-01-2007 and 02-02-2007
        mydata1 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

#combining data and time together
        mydata2 <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#subset globalActivePower
        mydata3 <- as.numeric(mydata1$Global_active_power)
#subset subMeterings        
        subMetering1 <- as.numeric(mydata1$Sub_metering_1)
        subMetering2 <- as.numeric(mydata1$Sub_metering_2)
        subMetering3 <- as.numeric(mydata1$Sub_metering_3)
#subset Global_reactive_power
        mydata4 <- as.numeric(mydata1$Global_reactive_power)
#subset Voltage
        mydata5 <- as.numeric(mydata1$Voltage)
#Create and save chart
        png("plot4.png", width=480, height=480)
        par(mfrow = c(2, 2)) 
        plot(mydata2, mydata3, type="l", xlab="", ylab="Global Active Power", cex=0.2)        
        plot(mydata2, mydata5, type="l", xlab="datetime", ylab="Voltage")       
        plot(mydata2, subMetering1, type="l", ylab="Energy Submetering", xlab="")
        lines(mydata2, subMetering2, type="l", col="red")
        lines(mydata2, subMetering3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")       
        plot(mydata2, mydata4, type="l", xlab="datetime", ylab="Global_reactive_power")  
        dev.off()