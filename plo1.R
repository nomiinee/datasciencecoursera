library(ggplot2)
library(dplyr)
setwd("C:/Users/Jirawech/Documents/#4assignment2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mdata<-merge(NEI,SCC,by.x="SCC", by.y = "SCC")
png(filename="plot1.png", width = 480 , height = 480)
#1
getYear<-unique(mdata$year)
totalEmis<-tapply(mdata$Emissions, mdata$year, sum)
plot(getYear, totalEmis, xlab = "Year", ylab= "Total Emission", main="Total Emission of pm-25 in US by years", pch = 20, type ='o')

dev.off()

#PM2.5 have decreased in Us from 1999-2008

