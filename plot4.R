generate_plot_4 <- function(){
    ## read the text file
    original_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
    
    ## filter it only the two dates required, 2007-02-01 and 2007-02-02
    original_data$Time <- strptime(paste(original_data$Date, original_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
    original_data$Date <- as.Date(original_data$Date, "%d/%m/%Y")
    filtered_data <- original_data[original_data$Date == as.Date("2007-02-01") | original_data$Date == as.Date("2007-02-02"),]
    
    ## converting the required column to numeric
    filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))
    filtered_data$Sub_metering_1 <- as.numeric(as.character(filtered_data$Sub_metering_1))
    filtered_data$Sub_metering_2 <- as.numeric(as.character(filtered_data$Sub_metering_2))
    filtered_data$Voltage <- as.numeric(as.character(filtered_data$Voltage))
    filtered_data$Global_reactive_power <- as.numeric(as.character(filtered_data$Global_reactive_power))
    
    par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    
    ## plot 1, top left
    plot(filtered_data$Time,
         filtered_data$Global_active_power, 
         type="l", 
         ylab="Global Active Power", 
         xlab="")
    
    ## plot 2, top right
    plot(filtered_data$Time, 
         filtered_data$Voltage,type="l", 
         ylab="Voltage", 
         xlab="datetime")
    
    ## plot 3, bottom left
    plot(filtered_data$Time,
         filtered_data$Sub_metering_1, 
         type="l", 
         xlab = "", 
         ylab="Energy sub metering")
    lines(filtered_data$Time,
          filtered_data$Sub_metering_2, 
          type="l", 
          col="red")
    lines(filtered_data$Time,
          filtered_data$Sub_metering_3, 
          type="l", 
          col="blue")
    
    legend("topright", 
           lwd=1, 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           pt.cex = 0.5,
           cex = 0.5,
           bty="n")
    
    ## plot 4, bottom right
    plot(filtered_data$Time, 
         filtered_data$Global_reactive_power,type="l", 
         ylab="Global_reactive_power", 
         xlab="datetime")
    
    dev.copy(png, "plot4.png")
    dev.off()
}