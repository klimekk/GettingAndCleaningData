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

##head(df1)

hist(df1$Global_active_power,col= "red",breaks = c(0.5*0:15), xlim=c(0,6), main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png, file="./data/plot1.png")
dev.off()


## hist(as.numeric(df1$Global_active_power)/1000,col= "red",breaks = c(0.5*0:15),xlim=c(0,6), main="Global Active Power",xlab="Global Active Power (kilowatts)")