#4
library(ggplot2)
library(dplyr)
setwd("C:/Users/Jirawech/Documents/#4assignment2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mdata<-merge(NEI,SCC,by.x="SCC", by.y = "SCC")
png(filename="plot4.png", width = 480 , height = 480)

#4
data4<-mdata %>% filter(grepl("Coal$", mdata$Short.Name))
totalCoal <- with(data4, tapply(Emissions, year, sum))
qplot(getYear, totalCoal) + geom_line() 
+ ggtitle("PM-25 Coal Emission in US by Year")+geom_point(shape=1, fill="blue", color="darkred", size=3)
+labs(x = "Year", y ="Emission")
dev.off()
#how have emissions from coal combustion-related sources changed from 1999-2008?
# Coal  combustion decreased from 1999-2008