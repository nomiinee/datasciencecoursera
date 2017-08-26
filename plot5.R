#5
library(ggplot2)
library(dplyr)
setwd("C:/Users/Jirawech/Documents/#4assignment2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mdata<-merge(NEI,SCC,by.x="SCC", by.y = "SCC")
png(filename="plot5.png", width = 480 , height = 480)

#5
mdata2<- subset(mdata, fips == "24510" )
getYear<-unique(mdata$year)
data5<- mdata2 %>% filter(grepl("(.*)[vV]ehicles", mdata2$SCC.Level.Two))
totalVeh <- with(data5, tapply(Emissions, year, sum))
qplot(getYear, totalVeh) + geom_line() + ggtitle("PM-25 Coal Emission in Baltimore by Year and vehicles")+
  geom_point(shape=1, fill="blue", color="darkred", size=3)+labs(x = "Year", y ="Emission")
dev.off()

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# Emissions from motor vehicle sources decreased from 1999-2008