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


##head(df1$Time)
##head(df1$Date)

plot(df1$Time, df1$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="./data/plot2.png")
dev.off()