##Read and subset the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Time <- paste(data$Date, data$Time)
data$Date <- NULL
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
data <- data[data$Time >= "2007-02-01" & data$Time < "2007-02-03",]
data <- data[!is.na(data$Time),]

##Create plot and save it as a png
Sys.setlocale("LC_TIME", "English")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file="plot3.png")
with(data, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
with(data, legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue")))
dev.off()