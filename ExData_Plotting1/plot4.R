if (!file.exists("./datax")){
  dir.create("./datax")
}

url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile = "./data/power_consumption.zip"
download.file(url,zipfile,mode="wb")
unzip(zipfile,overwrite=TRUE,exdir="./data")

##df<- read.table(, header=TRUE, sep= ";")

df <- read.table("./data/household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")

df1<- subset(df,Date %in% c("1/2/2007","2/2/2007"))

df1$Time <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")

df1$Date <- as.Date(df1$Date, "%d/%m/%Y")

## head(df1)
##head(df1$Time)
##head(df1$Date)

defpar<-par()

##par(mfcol=c(2,2),mar=c(5,4,2,1))
png(file="./data/plot4.png", width = 480, height = 480, units = "px", pointsize = 12,bg="white")
par(mfcol=c(2,2),mar=c(5,4,2,1))

plot(df1$Time, df1$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")


plot(df1$Time, df1$Sub_metering_1,
     type="l",
     xlab="", col = "black",
     ylab="Energy sub metering")
lines(df1$Time,df1$Sub_metering_2,
      type="l",col="red")
lines(df1$Time,df1$Sub_metering_3,
      type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,box.lwd=0, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.5)

plot(df1$Time, df1$Voltage,
     type="l",
     xlab="",
     ylab="Voltage")


plot(df1$Time, df1$Global_reactive_power,
     type="l",
     xlab="",
     ylab="Global_reactive_power")
##dev.copy(png, file="./data/plot4.png")
dev.off()

par(defpar)