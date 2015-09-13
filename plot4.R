##Read and subset the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Time <- paste(data$Date, data$Time)
data$Date <- NULL
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
data <- data[data$Time >= "2007-02-01" & data$Time < "2007-02-03",]
data <- data[!is.na(data$Time),]

##Set plot parameters
Sys.setlocale("LC_TIME", "English")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file="plot4.png")
par(mfrow=c(2,2))
par(mar=c(2,4,3,2))

##1st plot
with(data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

##2nd plot
with(data, plot(Time, Voltage, type="l"))

##3rd plot
with(data, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
with(data, legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty = "n"))

##4th plot
with(data, plot(Time, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power"))

dev.off()