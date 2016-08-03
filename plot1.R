library(lubridate)

# Unconditionally read data file
df <- read.csv( file="household_power_consumption.txt", 
                na.strings = c("?"), 
                header = TRUE,
                sep=";", comment.char="" )
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subset to 2007
df <- subset(df, year(Date) == 2007 & 
                month(Date) == 2 & 
                day(Date) %in% c(1,2))

df$Timestamp <- as.POSIXct(paste(df$Date, df$Time))

# Plot 1
png(file="plot1.png")

hist(df$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()