#Plot 4

##This R script plots total US PM2.5 emissions for coal combustion-related 
##sources for years 1999, 2002, 2005, and 2008 using ggplot2

##Load ggplot2
library(ggplot2)

##Read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

##Subset coal combustion-related sources 
coal <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Institutional - Coal", 
"Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - Coal"))

NEIcoal <- subset(NEI, SCC %in% coal$SCC)

##Plot graph
png("plot4.png", height = 500, width = 500)
qplot(x = as.factor(year), y = log10(Emissions), data = NEIcoal) + geom_boxplot() +
  ggtitle(expression('US Coal Combustion Log10 PM'[2.5]*' Emissions: 1999, 2002, 2005, 2008')) +
  xlab("Year") + ylab(expression('Log10 PM'[2.5]*' Emissions')) + 
  theme(plot.title = element_text(size = 11.25), axis.title.y = element_text(size = 10), 
        axis.title.y = element_text(size = 10))
dev.off()
