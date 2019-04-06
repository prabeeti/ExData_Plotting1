#For Plot 3 -Energy Submetering from dataset household power consumption
active_power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(active_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot_result <- subset(active_power,active_power$Date=="1/2/2007" | active_power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
plot_result$Date <- as.Date(plot_result$Date, format="%d/%m/%Y")
plot_result$Time <- strptime(plot_result$Time, format="%H:%M:%S")
plot_result[1:1440,"Time"] <- format(plot_result[1:1440,"Time"],"2007-02-01 %H:%M:%S")
plot_result[1441:2880,"Time"] <- format(plot_result[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plotting for energy submetering 


plot(plot_result$Time,plot_result$Sub_metering_1,type="n",,main="Energy sub-metering",xlab="",ylab="Energy sub metering")
with(plot_result,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(plot_result,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(plot_result,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))