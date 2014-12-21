hhdata <- read.csv("getdata_data_ss06hid.csv")
# [,11] ACR = 3, stand ten or more acres
# [,12] AGS = 6, sales of $10000+ agricultural products
# agricultureLogical <- hhdata[]
x <- hhdata$ACR
y <- hhdata$AGS
agricultureLogical <- ((y == 6) & (x == 3))
which(agricultureLogical)
