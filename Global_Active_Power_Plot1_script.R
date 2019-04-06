#For Plot 1 -Global Active Power from dataset household power consumption
active_power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(active_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot_result <- subset(active_power,active_power$Date=="1/2/2007" | active_power$Date =="2/2/2007")

# histogram for global active power
hist(as.numeric(as.character(plot_result$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

