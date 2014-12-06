#TITLE:Exploratory Data Analysis-Coursera:Exercise 1(plot4.png)
#AUTHOR: A O MUNDADA
#DATE: 06/12/2014

#The following code creates an histogram from household power consumption data.

#Loading required libraries
library("sqldf") #helps to retrive a small portion of the huge data.

#retriving the data to the variable PowerData
PowerData<-read.csv.sql("household_power_consumption.txt", sql="SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')",sep=";",header=TRUE)

#Now, we'll use strptime() function to convert date and time character variables
#to R's Date object which can be used easily in the plots.

dates<-paste(as.Date(PowerData$Date,"%d/%m/%Y"),PowerData$Time) #still character variables

dates<-strptime(dates,format="%Y-%m-%d %H:%M:%S") #Converted to date objects :D


png("plot4.png")

par(mfrow=c(2,2)) #matrix dimentions for plots are set up

#four plots will be printed now
plot(dates,PowerData$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")

plot(dates,PowerData$Voltage, type="l",ylab="Voltage",xlab="datetime")


#plot started
plot(dates,PowerData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(dates,PowerData$Sub_metering_2,type="l",col="Red") #Adding new points
points(dates,PowerData$Sub_metering_3,type="l",col="Blue") #Adding new points

#adding Legend
legendColors<-c("Black","Red","Blue")
legendNames<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=legendNames,col=legendColors,border="black",lty=1)


plot(dates,PowerData$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
