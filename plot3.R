install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, sep=";")
closeAllConnections()

png(file = "plot3.png", width = 480, height = 480, units = "px")

data$datetime <- strptime(paste(data$Date,data$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")
with(data, {
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, type = "l", col ="red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", lty = c(1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex=1)

dev.off()