# cat("\014")  # Clear Console
library(jpeg)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL, dest = "getdata_jeff.jpg")
y <- readJPEG("getdata_jeff.jpg", native=TRUE)
quantile(y)
quantile(y, probs = c(0.3,0.8))
