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
twodays$Date <- as.character(twodays$Date)
twodays$Time <- as.character(twodays$Time)
timebyMin <- strptime(paste(twodays$Date, twodays$Time), "%Y-%m-%d %H:%M:%S")
twodays$new.col <- timebyMin
colnames(twodays)[10] <- "timebyMin"

#draw plot 4

png("../ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(twodays$timebyMin, twodays$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(twodays$timebyMin, twodays$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(twodays$timebyMin, twodays$Sub_metering_1, type = "n",ylab = "Energy sub metering", xlab = "")
points(twodays$timebyMin, twodays$Sub_metering_1, col = "black", type = "l")
points(twodays$timebyMin, twodays$Sub_metering_2, col = "red", type = "l")
points(twodays$timebyMin, twodays$Sub_metering_3, col = "blue", type = "l")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(twodays$timebyMin, twodays$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()