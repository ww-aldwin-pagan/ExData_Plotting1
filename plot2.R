# source("Coursera/Exploratory Data Analysis/ExData_Plotting1/plot2.R")

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
# png( filename = "Coursera/Exploratory Data Analysis/ExData_Plotting1/Plot2.png", width = 480, height = 480)
#  Did not know how to show short day names on x-axis
plot(feb$Global_active_power , xlab="", ylab="Global Active Power (kilowatts)" )
plot(
    feb$Sub_metering_1, 
    xlab="", 
    ylab="Energy Sub metering",     
    type = "l",
    col="black"
    )
#Uncomment to disable PNG device. You may need to change the plot file directory.
# dev.off()
