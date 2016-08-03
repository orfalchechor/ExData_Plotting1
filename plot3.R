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

png(file="plot3.png")

plot( df$Timestamp, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines( df$Timestamp, df$Sub_metering_1, col="black", pch=15 )
lines( df$Timestamp, df$Sub_metering_2, col="red", pch=15 )
lines( df$Timestamp, df$Sub_metering_3, col="blue", pch=15 )
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()