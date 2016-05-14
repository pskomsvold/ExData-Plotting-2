#Plot 3

##This R script plots PM2.5 emissions for each source type in Baltimore City, 
##Maryland for years 1999, 2002, 2005, and 2008 using ggplot2

##Load ggplot2
library(ggplot2)

##Read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

##Subset Baltimore City data
balt <- subset(NEI, fips == "24510")

##Plot graph
png("plot3.png", height = 500, width = 500)
qplot(x = type, y = log10(Emissions), data = balt) + geom_boxplot(aes(fill = as.factor(year))) +
  ggtitle(expression('PM'[2.5]*' Emissions in Baltimore City, Maryland by Source: 1999, 2002, 2005, 2008')) +
  xlab("Year") + ylab(expression('Log 10 PM'[2.5]*' Emissions')) + 
  theme(plot.margin = unit(c(4, 1, 1, 1), "mm"), plot.title = element_text(size = 10.5, hjust = 0.5), axis.title.y = element_text(size = 11), 
        axis.title.x = element_text(size = 11)) + scale_fill_discrete(name="Year", labels = c("1999", "2002", "2005", "2008"))
dev.off()
