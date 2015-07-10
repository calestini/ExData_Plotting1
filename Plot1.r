mydata <- read.table(file="household_power_consumption.txt",sep=";", header=TRUE) #read data

workingdata1  <- subset(mydata, Date == "1/2/2007") #subset for one date
workingdata2  <- subset(mydata, Date == "2/2/2007") #subset for another date

fdata  <- rbind(workingdata1, workingdata2) #combining both subsets (Date is still as class factor here)

#making the Global Active Power column as numeric
fdata$Global_active_power  <- as.numeric(fdata$Global_active_power) 

#Changing the unit of measurement
fdata$Global_active_power  <- fdata$Global_active_power/500

#Opening connection and creating the Histogram
png(filename="Plot1.png", width=480, height=480)
hist(fdata$Global_active_power, main="Global Active Power", col = "red", ylab="Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()
