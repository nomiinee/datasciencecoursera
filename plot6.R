library(ggplot2)
library(dplyr)
setwd("C:/Users/Jirawech/Documents/#4assignment2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mdata<-merge(NEI,SCC,by.x="SCC", by.y = "SCC")
png(filename="plot6.png", width = 480 , height = 480)
#6

mdata3<- subset(mdata, fips == "24510" | fips == "06037")
getYear<-unique(mdata$year)
data6<- mdata3 %>% filter(grepl("(.*)[vV]ehicles", mdata3$SCC.Level.Two)) %>% group_by(fips, year) %>% summarise(Emissions = sum(Emissions))
p<-qplot(year, Emissions, data = data6, col = fips) + geom_line() + ggtitle("PM-25 Coal Emission in Baltimore and Los Angeles by Year and vehicles")
p+geom_point(shape=1, fill="blue", color="darkred", size=3)+
  labs(x = "Year", y ="Emission")+scale_color_manual(labels = c("Los Angeles", "Baltimore"), values = c("blue", "red")) 
dev.off()

# Emissions from motor vehicle sources in Baltimore City slightly decreased from 1999-2008, and slightly increased in Los Angeles