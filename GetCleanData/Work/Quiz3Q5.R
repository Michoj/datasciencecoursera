library("sringr", lib.loc="C:/Source/R_Language/RLibs")
library(Hmisc)

fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
download.file(fileURL1, dest = "getdata_data_GDP.csv")
gdp <- read.csv("./getdata_data_GDP.csv")
head(gdp)
gdp <- gdp[c(-1:-4),] # Remove first 4 rows (empty, no relavent info)
# gdp  X = Country shortcode
# gdp$Gross.domestic.product.2012 = ranking
# fedstats CountryCode = Country shortcode
names(gdp)
# find all gdp rows with country (5-219)
gdp2 <- gdp[(!gdp$X=="")&(!gdp$Gross.domestic.product.2012==""),]
gdp2 <- gdp[1:215,]
# remove non-ranked countries
names(gdp2)[2] <- "GDP2012"
gdp2 <- gdp2[!is.na(gdp2$GDP2012),]
# convert factors and strings to numeric values
y <- gdp2[,2]
y <- as.numeric(levels(y))[y] # convert factor: as.numeric(levels(f))[f]
gdp2[,2] <- y
y <- gdp2[,5]
y <- as.integer(str_trim(gsub("\\,","",y)))
gdp2[,5] <- y
z2 <- gdp2[,c(2,5)]
cut2(z2[,1],g=5)
names(z2)[2] <- "income"
z2
