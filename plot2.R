generate_plot_2 <- function(){
    ## read the text file
    original_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
    
    ## filter it only the two dates required, 2007-02-01 and 2007-02-02
    original_data$Time <- strptime(paste(original_data$Date, original_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
    original_data$Date <- as.Date(original_data$Date, "%d/%m/%Y")
    filtered_data <- original_data[original_data$Date == as.Date("2007-02-01") | original_data$Date == as.Date("2007-02-02"),]
    
    ## converting the required column to numeric
    filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))
    
    ## plot
    plot(filtered_data$Time, 
         filtered_data$Global_active_power, 
         type="l", 
         ylab="Global Active Power (kilowatts)", 
         xlab="")
    
    dev.copy(png, "plot2.png")
    dev.off()
}