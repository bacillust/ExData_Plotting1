library(lubridate)
Sys.setlocale("LC_TIME", "C")

## loading data
input <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
date_vec_tmp <- as.character(input$Date)
target_idx <- c(which(date_vec_tmp == "1/2/2007"), which(date_vec_tmp == "2/2/2007"))
input2 <- input[target_idx,]

### Plot2
Sys.setlocale("LC_TIME", "C")
png(filename = "plot2.png", width = 480, height = 480)
date_time_og <- paste(input2$Date, input2$Time)
date_time_cg <- dmy_hms(date_time_og)
plot(x = date_time_cg, y = as.numeric(input2$Global_active_power), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
