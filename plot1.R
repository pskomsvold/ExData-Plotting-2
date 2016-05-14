#Plot 1
##This R script calculates and plots total PM2.5 emissions in the US
##for years 1999, 2002, 2005, and 2008 using the base plotting system

##Read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

##Calculate total emissions
totEm <- aggregate(Emissions ~ year, NEI, sum)

##Create plot
png("plot1.png", width = 480, height = 480)
plot(totEm, type = "o", xlab = "Year", ylab = expression('Total PM'[2.5]*' Emissions (in tons)'), 
     pch = 19, lty = 2, 
     main= expression('Total PM'[2.5]*' Emissions (in tons) From All US Sources: 1999, 2002, 2005, 2008'), 
     cex.main = .93)
dev.off()
