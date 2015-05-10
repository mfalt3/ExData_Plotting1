plot4<-function(){
  initial <- read.table("household_power_consumption.txt", header = TRUE, sep=";") ## Read data from source file
  initial.Date<-as.character(initial$Date) ## Begin process of reformatting Date field
  initial$Date<-as.Date(initial$Date, format="%d/%m/%Y") ## Reformat Date field and change to "Date"
  FebDS<-subset(initial, initial$Date=="2007-02-01"|initial$Date=="2007-02-02") ##Subset Date field for 02/01/2007 and 02/02/2007 per instruction
  FebDS$Global_active_power<-as.numeric(as.character(FebDS$Global_active_power)) ##Convert Global Active Power field to numeric for plotting
  FebDS$Global_reactive_power<-as.numeric(as.character(FebDS$Global_reactive_power)) ##Convert Global Reactive Power field to numeric for plotting
  FebDS$Sub_metering_1<-as.numeric(as.character(FebDS$Sub_metering_1)) ##Convert Sub_metering_1 field to numeric for plotting
  FebDS$Sub_metering_2<-as.numeric(as.character(FebDS$Sub_metering_2)) ##Convert Sub_metering_2 field to numeric for plotting
  ##Sub_metering_3 field is already in numeric class - no need to convert
  FebDS$Voltage<-as.numeric(as.character(FebDS$Voltage)) ##Convert Voltage field to numeric for plotting
  FebDS$Date<-paste(FebDS$Date, FebDS$Time, sep=" ") ##Concatenate Date and Time
  FebDS$Date<-strptime(FebDS$Date, "%Y-%m-%d %H:%M:%OS") ##Format Date and Time field
  png(file = "plot4.png", width=480, height=480) ##Open the PNG device and create the plot4.PNG file
  par(mfcol=c(2,2)) ##Prepare file for 2 columns and 2 rows of plots  
##create Global_active_power plot in top left
  plot(FebDS$Date, FebDS$Global_active_power, type="o", pch=26, xlab="", ylab="Global Active Power") ##Build Globa_active_power line graph, not shown on screen
##create sub_metering plot in bottom left
  plot(FebDS$Date, FebDS$Sub_metering_1, type="o", pch=26, xlab="", ylab="Energy sub metering") ##Build Sub_metering line graph, not shown on screen
   lines(FebDS$Date, FebDS$Sub_metering_2, type="o", pch=26, col="red") ##Add Sub_metering_2 line as color red
   lines(FebDS$Date, FebDS$Sub_metering_3, type="o", pch=26, col="blue") ##Add Sub_metering_3 line as color blue
   legend("topright", lty=c(1,1,1), lwd=c(2,2,2), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ##Establish legend
##create voltage plot in top right
  plot(FebDS$Date, FebDS$Voltage, type="o", pch=26, xlab="datetime", ylab="Voltage") ##Build Voltage line graph, not shown on screen
##create Global_reactive_power plot in bottom right
  plot(FebDS$Date, FebDS$Global_reactive_power, type="o", pch=26, xlab="datetime", ylab="Global_reactive_power") ##Build Globa_reactive_power line graph, not shown on screen
  dev.off() ##Close the PNG file device
}