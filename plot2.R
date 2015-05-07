##check dataset
if (!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="exdata-data-household_power_consumption.zip",
                method="curl")
  unzip("exdata-data-household_power_consumption.zip")  
}

data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")

names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$datetime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(data$datetime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()
