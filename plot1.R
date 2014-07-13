# Read comma-separated text file
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Remove question marks and update date format
x<-data
x<-x[!(x$Global_active_power=="?"),]   
x$Date<-as.Date(x$Date,format="%d/%m/%Y")       
x$Global_active_power<-as.numeric(as.character((x$Global_active_power)))        

# Subset 2 days of data
x.2007<-subset(x,Date>as.Date("2007-01-31")& Date<as.Date("2007-02-03"))

# Create histogram with appropriate details
par(cex=.85,cex.axis=.85,cex.lab=.85,cex.main=1)
with(x.2007,hist(Global_active_power,xlim=range(Global_active_power),ylim=c(0,1200),xaxt="n",
                 main="Global Active Power",
                 xlab="Global Active Power (kilowatts)",col="red"))
axis(1,at=c(0,2,4,6))

# Save plots as plot1.png
png("plot1.png")

with(x.2007,hist(Global_active_power,xlim=range(Global_active_power),ylim=c(0,1200),xaxt="n",
                 main="Global Active Power",
                 xlab="Global Active Power (kilowatts)",col="red"))
axis(1,at=c(0,2,4,6))

dev.off()