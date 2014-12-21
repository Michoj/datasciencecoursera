fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL1, dest = "getdata_data_GDP.csv")
download.file(fileURL2, dest = "getdata_data_FEDSTATS_Country.csv")
gdp <- read.csv("./getdata_data_GDP.csv")
fedstats <- read.csv("./getdata_data_FEDSTATS_Country.csv")
head(gdp)
gdp <- gdp[c(-1:-4),] # Remove first 4 rows (empty, no relavent info)
head(fedstats)
# gdp  X = Country shortcode
# gdp$Gross.domestic.product.2012 = ranking
# fedstats CountryCode = Country shortcode
names(gdp)
names(fedstats)
intersect(names(gdp),names(fedstats))
# find all gdp rows with country & ranking
gdp2 <- gdp[(!gdp$X=="")&(!gdp$Gross.domestic.product.2012==""),]
mergedData <- merge(gdp2,fedstats,by.x="X",by.y="CountryCode",all.x=TRUE)
# Rank is a factor
y <- mergedData[,2]
y <- as.numeric(levels(y))[y] # convert factor: as.numeric(levels(f))[f]
mergedData[,2] <- y
# Rank (mergedData[,2]) now numeric
# Question 3
# mergedData <- mergedData[order(-mergedData[,2]),] # order descending
# mergedData[13,1:5]
# Question 4
# Income mergedData[,12]
z2 <- mergedData[,c(2,12)]
x <- z2[,1]
y <- z2[,2]
tapply(x,y, mean)
