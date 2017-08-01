### common
library(lubridate)
Sys.setlocale("LC_TIME", "C")

## loading data
input <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
date_vec_tmp <- as.character(input$Date)
target_idx <- c(which(date_vec_tmp == "1/2/2007"), which(date_vec_tmp == "2/2/2007"))
input2 <- input[target_idx,]

### Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(input2$Global_active_power), col = "red", xlab = "Global Active Powers (kilowatts)", main = "Global Active Power")
dev.off()
