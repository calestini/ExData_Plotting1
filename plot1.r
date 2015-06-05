#plot1.r
        mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset to 02-01-2007 and 02-02-2007
        mydata1 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

#subset to only Global_active_power
        mydata2 <- as.numeric(mydata1$Global_active_power)  
#creating and savign the histogram
        png("plot1.png", width=480, height=480)
        hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
