#TITLE:Exploratory Data Analysis-Coursera:Exercise 1(plot1.png)
#AUTHOR: A O MUNDADA
#DATE: 06/12/2014

#The following code creates an histogram from household power consumption data.

#Loading required libraries
library("sqldf") #helps to retrive a small portion of the huge data.

#retriving the data to the variable PowerData
PowerData<-read.csv.sql("household_power_consumption.txt", sql="SELECT * from file WHERE Date in ('1/2/2007','2/2/2007')",sep=";",header=TRUE)

#Plot being saved to png now
png("plot1.png")
hist(PowerData[,3],main="Global Active Power", xlab="GLobal Active Power(kilowatts)",col="Red")
dev.off()
