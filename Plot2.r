mydata <- read.table(file="household_power_consumption.txt",sep=";", header=TRUE) #read data

workingdata1  <- subset(mydata, Date == "1/2/2007") #subset for one date
workingdata2  <- subset(mydata, Date == "2/2/2007") #subset for another date

fdata  <- rbind(workingdata1, workingdata2) #combining both subsets (Date is still as class factor here)

fdata$Date <- as.Date(fdata$Date, "%d/%m/%Y") #Transforming Date to date class

fdata$DateTime <- paste(fdata$Date, fdata$Time, sep=' ') # Create a new column for date and time

fdata$DateTime <- strptime(fdata$DateTime, format="%Y-%m-%d %H:%M:%S") #Change to POSIlt class

#Create and save chart
png(filename="Plot2.png", width=480, height=480)
with(fdata , plot(DateTime , Global_active_power , xlab="" , ylab="Global Active Power (kilowatts)" , type="l"))
dev.off()
