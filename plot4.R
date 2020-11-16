data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
wanteddata <- subset(data, date1<=Date & Date<=date2)
wanteddata[wanteddata=="?"] = NA
for (element in names(wanteddata)){
 	wanteddata[element=="?"]<- NA}
datetime <- as.POSIXct(paste(wanteddata$Date, wanteddata$Time), format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png")
par(mfrow = c(2,2))
with(wanteddata, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NULL))
with(wanteddata, plot(datetime, Voltage, type = "l"))
with(wanteddata, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", type = "l"))
lines(datetime, wanteddata$Sub_metering_2, col = "red", type ="l")
lines(datetime, wanteddata$Sub_metering_3, col = "blue", type ="l")
legend("toprigh", pch = 18, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
with(wanteddata, plot(datetime, Global_reactive_power, type = "l"))
dev.off()