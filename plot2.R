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
png(file="plot2.png")
with(data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()