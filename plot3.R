generate_plot_3 <- function(){
    ## read the text file
    original_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
    
    ## filter it only the two dates required, 2007-02-01 and 2007-02-02
    original_data$Time <- strptime(paste(original_data$Date, original_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
    original_data$Date <- as.Date(original_data$Date, "%d/%m/%Y")
    filtered_data <- original_data[original_data$Date == as.Date("2007-02-01") | original_data$Date == as.Date("2007-02-02"),]
    
    ## converting the required column to numeric
    filtered_data$Sub_metering_1 <- as.numeric(as.character(filtered_data$Sub_metering_1))
    filtered_data$Sub_metering_2 <- as.numeric(as.character(filtered_data$Sub_metering_2))
    
    ## plot
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
    
    par(cex=.5)    
    
    legend("topright", 
           lwd=1, 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.copy(png, "plot3.png")
    dev.off()
}