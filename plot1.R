#import data

file <- read.table("../ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep = ";")
file$Date <- as.Date(file$Date, "%d/%m/%Y")
twodays <- file[file$Date == as.Date("2007-02-01") | file$Date == as.Date("2007-02-02"),]

#clean data

twodays$Global_active_power <- as.numeric(as.character(twodays$Global_active_power))
twodays$Global_reactive_power <- as.numeric(as.character(twodays$Global_reactive_power))
twodays$Voltage <- as.numeric(as.character(twodays$Voltage))
twodays$Global_intensity <- as.numeric(as.character(twodays$Global_intensity))
twodays$Sub_metering_1 <- as.numeric(as.character(twodays$Sub_metering_1))
twodays$Sub_metering_2 <- as.numeric(as.character(twodays$Sub_metering_2))
twodays$Sub_metering_3 <- as.numeric(as.character(twodays$Sub_metering_3))

#draw plot 1

png("../ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
hist(twodays$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
