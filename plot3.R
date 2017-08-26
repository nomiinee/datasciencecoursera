library(ggplot2)
library(dplyr)
setwd("C:/Users/Jirawech/Documents/#4assignment2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mdata<-merge(NEI,SCC,by.x="SCC", by.y = "SCC")
png(filename="plot3.png", width = 480 , height = 480)

#3
mdata2<- subset(mdata, fips == "24510" )
getYear<-unique(mdata$year)
totalEmisInBalByType<-mdata2 %>% group_by(year, type ) %>% summarize(Emissions = sum(Emissions))
qplot(year, Emissions, data= totalEmisInBalByType, col = type)+
  geom_line()+ggtitle("Total Emission of pm-25 in Baltimore City by years and Type")
dev.off()

#Only type POINT have seen increased in emission from 1999-2008, and others have decreased