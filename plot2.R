library(ggplot2)
library(dplyr)
setwd("C:/Users/Jirawech/Documents/#4assignment2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mdata<-merge(NEI,SCC,by.x="SCC", by.y = "SCC")
png(filename="plot2.png", width = 480 , height = 480)

#2
getYear<-unique(mdata$year)
mdata2<- subset(mdata, fips == "24510" )
totalEmisInBal <-with(mdata2, tapply(Emissions, year, sum))
plot(getYear, totalEmisInBal, xlab = "Year", ylab= "Total Emission", 
     main="Total Emission of pm-25 in Baltimore City by years", pch = 20, type ='o', col="red")
dev.off()

#PM2.5 have fluctuated from 1999 to 2008, and finally decreased in the Baltimore City, Maryland in year 2008