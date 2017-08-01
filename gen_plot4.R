### common
library(lubridate)
Sys.setlocale("LC_TIME", "C")

## loading data
input <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
date_vec_tmp <- as.character(input$Date)
target_idx <- c(which(date_vec_tmp == "1/2/2007"), which(date_vec_tmp == "2/2/2007"))
input2 <- input[target_idx,]

### Plot4
Sys.setlocale("LC_TIME", "C")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))
## grid (1, 1)
plot(x = date_time_cg, y = as.numeric(input2$Global_active_power), type="l", xlab = "", ylab = "Global Active Power")

## grid (1, 2)
plot(x = date_time_cg, y = as.numeric(input2$Voltage), type="l", xlab = "datetime", ylab = "Voltage")

## grid (2, 1)
plot(x = date_time_cg, y = as.numeric(input2$Sub_metering_1), type="l", xlab = "", ylab = "Energy sub metering")
points(x = date_time_cg, y = as.numeric(input2$Sub_metering_2), type="l", col="red")
points(x = date_time_cg, y = as.numeric(input2$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), box.lty = 0)

## grid (2, 2)
plot(x = date_time_cg, y = as.numeric(input2$Global_reactive_power), type="l", xlab = "datetime", ylab = "Global_reactiv_power")
dev.off()

