#Plot 5

##This R script plots totalPM2.5 emissions for motor vehicle sources 
##in Baltimore City, Maryland for years 1999, 2002, 2005, and 2008 using ggplot2

##Load ggplot2
library(ggplot2)

##Read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

##Subset Onroad sources
onroad <- subset(SCC, Data.Category == "Onroad")
NEIveh <- subset(NEI, SCC %in% onroad$SCC)

##Subset Baltimore City data
baltimore <- subset(NEIveh, fips == "24510")

##Plot graph
png("plot5.png", height = 500, width = 500)
qplot(x = as.factor(year), y = log10(Emissions), data = baltimore) + geom_boxplot() +
  ggtitle(expression('Motor Vehicle Log10 PM'[2.5]*' Emissions in Baltimore City, Maryland: 1999, 2002, 2005, 2008')) +
  xlab("Year") + ylab(expression('Coal Combustion Log10 PM'[2.5]*' Emissions')) + 
  theme(plot.title = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.title.y = element_text(size = 10))
dev.off()
