#plot2.r
        mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset to 02-01-2007 and 02-02-2007
        mydata1 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

#combining data and time together
        mydata2 <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#subset globalActivePower
        mydata3 <- as.numeric(mydata1$Global_active_power)
#create and save file
        png("plot2.png", width=480, height=480)
        plot(mydata2, mydata3, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()