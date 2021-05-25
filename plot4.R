# source("Coursera/Exploratory Data Analysis/ExData_Plotting1/plot4.R")

powerConsumption <- read.csv(
file = "Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt", 
header = TRUE,  
sep = ";", 
stringsAsFactors = FALSE,
colClasses = c(
    "Date" = "character", 
    "Time" = "character", 
    "Global_active_power" = "numeric", 
    "Global_reactive_power" = "numeric",
    "Voltage" = "numeric",
    "Global_intensity" = "numeric",
    "Sub_metering_1" = "numeric",
    "Sub_metering_2" = "numeric",
    "Sub_metering_3" = "numeric"
 ),
 na.strings=c("?")
)

powerConsumption$Date <- as.Date(strptime(powerConsumption$Date,format="%d/%m/%Y"), "%y-%m-%d")

# Did not know how to filter/skip some rows on the reading process. 
# That is why I proceed with a not very performant approach of a subset. 
feb <- subset(powerConsumption, Date >= "2007-02-01" & Date <= "2007-02-02")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.

#Uncomment to enable PNG device. You may need to change the plot file directory.
png( filename = "Coursera/Exploratory Data Analysis/ExData_Plotting1/Plot4.png", width = 480, height = 480)
#  Did not know how to show short day names on x-axis
par(mfrow=c(2,2))
# Global Active Power
plot(
    feb$Global_active_power, 
    xlab="", 
    ylab="Global Active Power",     
    type = "l",
    col="black"
    )
# Voltage
plot(
    feb$Voltage,
    xlab="", 
    ylab="Voltage",  
    type = "l",
    col="black"
    )
# Energy Sub metering
plot(
    feb$Sub_metering_1, 
    xlab="", 
    ylab="Energy Sub metering",     
    type = "l",
    col="black"
    )
lines(
    feb$Sub_metering_2,
    type = "l",
    col="red"
    )
lines(
    feb$Sub_metering_3,
    type = "l",
    col="blue"
    )
legend(
    "topright",
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1,
    col = c("black", "red", "blue")
       )
       
legend(
    "topright",
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1,
    col = c("black", "red", "blue")
       )
# Global Reactive Power
plot(
    feb$Global_reactive_power, 
    xlab="", 
    ylab="Global Reactive Power",     
    type = "l",
    col="black"
    )

#Uncomment to disable PNG device. You may need to change the plot file directory.
dev.off()
