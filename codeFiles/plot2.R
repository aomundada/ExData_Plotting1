#TITLE:Exploratory Data Analysis-Coursera:Exercise 1(plot2.png)
#AUTHOR: A O MUNDADA
#DATE:06/12/2014

#The following code creates an histogram from household power consumption data.

#Loading required libraries
library("sqldf") #helps to retrive a small portion of the huge data.

#retriving the data to the variable PowerData
PowerData<-read.csv.sql("household_power_consumption.txt", sql="SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')",sep=";",header=TRUE)

#Now, we'll use strptime() function to convert date and time character variables
#to R's Date object which can be used easily in the plots.

dates<-paste(as.Date(PowerData$Date,"%d/%m/%Y"),PowerData$Time) #still character variables

dates<-strptime(dates,format="%Y-%m-%d %H:%M:%S") #Converted to date objects :D

#Plot being saved to png now
png("plot2.png")
plot(dates,PowerData$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
