data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
wanteddata <- subset(data, date1<=Date & Date<=date2)
wanteddata[wanteddata=="?"] = NA
for (element in names(wanteddata)){
 	wanteddata[element=="?"]<- NA}
datetime <- as.POSIXct(paste(wanteddata$Date, wanteddata$Time), format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png")
with(wanteddata, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NULL))
dev.off()