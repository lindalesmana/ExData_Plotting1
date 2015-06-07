install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, sep=";")
closeAllConnections()

png(file = "plot2.png", width = 480, height = 480, units = "px")

data$datetime <- strptime(paste(data$Date,data$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()