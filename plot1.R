data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
wanteddata <- subset(data, date1<=Date & Date<=date2)
wanteddata[wanteddata=="?"] = NA
wanteddata$Time <- strptime(wanteddata$Time,format = "%H:%M:%S")
for (element in names(wanteddata)){
 	wanteddata[element=="?"]<- NA}
#Creating the first plot 
png(filename="plot1.png")
with(wanteddata, hist(as.numeric(Global_active_power), col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()