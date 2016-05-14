#Plot 2
##This R script calculates and plots total PM2.5 emissions in Baltimore City, Maryland
##for years 1999, 2002, 2005, and 2008 using the base plotting system

##Read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

##Subset Baltimore City data
balt <- subset(NEI, fips == "24510")

##Calculate total emissions 
totEmb <- aggregate(Emissions ~ year, balt, sum)

##Create line graph
png("plot2.png", width = 480, height = 480)
plot(totEmb, type = "o", xlab = "Year", ylab = expression('Total PM'[2.5]*' Emissions (in tons)'), 
     pch = 19, lty = 2, col = "blue", 
     main= expression('Total PM'[2.5]*' Emissions (in tons) From All Sources in Baltimore City, Maryland: 1999, 2002, 2005, 2008'), 
     cex.main = .80)
dev.off()
