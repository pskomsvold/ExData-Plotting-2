#Plot 6

##This R script plots US PM2.5 emissions for motor vehicle sources in 
##Baltimore City, Maryland and Los Angeles County for years 1999, 2002, 2005, and 2008 using ggplot2

##Load ggplot2
library(ggplot2)

##Read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

##Subset Onroad sources
onroad <- subset(SCC, Data.Category == "Onroad")
NEIveh <- subset(NEI, SCC %in% onroad$SCC)

##Subset Baltimore City and Los Angeles County data
bcla <- subset(NEIveh, fips == "24510" | fips == "06037")

##Plot graph
png("plot6.png", height = 500, width = 500)
qplot(x = as.factor(year), y = log10(Emissions), data = bcla) + geom_boxplot(aes(fill = fips)) +
  ggtitle(expression('Motor Vehicle PM'[2.5]*' Emissions (in tons) in Baltimore City, Maryland: 1999, 2002, 2005, 2008')) +
  xlab("Year") + ylab(expression('Coal Combustion Log 10 PM'[2.5]*' Emissions (in tons)')) + 
  theme(plot.title = element_text(size = 10, hjust = 0.4), axis.title.y = element_text(size = 10), 
        axis.title.y = element_text(size = 10)) + scale_fill_discrete(name="Cities", labels = c("Los Angeles", "Baltimore"))
dev.off()
