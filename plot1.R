plot1<-function(){
  initial <- read.table("household_power_consumption.txt", header = TRUE, sep=";") ## Read data from source file
  initial.Date<-as.character(initial$Date) ## Begin process of reformatting Date field
  initial$Date<-as.Date(initial$Date, format="%d/%m/%Y") ## Reformat Date field and change to "Date"
  FebDS<-subset(initial, initial$Date=="2007-02-01"|initial$Date=="2007-02-02") ##Subset Date field for 02/01/2007 and 02/02/2007 per instruction
  FebDS$Global_active_power<-as.numeric(as.character(FebDS$Global_active_power)) ##Convert Global Active Power field to numeric for plotting
  png(file = "plot1.png", width=480, height=480) ##Open the PNG device and create the plot1.PNG file
  hist(FebDS$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power") ##Build histogram, not shown on screen
  dev.off() ##Close the PNG file device
}