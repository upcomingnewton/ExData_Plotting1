# install sql library
#install.packages("sqldf")
library(sqldf)


fname <- "household_power_consumption.txt"

# read the records from data file where records are on date : '1/2/2007' OR Date = '2/2/2007'"
my_sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
household_data <- read.csv2.sql(fname, my_sql,sep=";")

# format the data
household_data$DateTime <- paste(household_data$Date, household_data$Time)
household_data$DateTime1 <- as.POSIXct(strptime(household_data$DateTime, "%d/%m/%Y %H:%M:%S"))

#plot the data into plot3.png
png("plot3.png",width=480,height=480)
plot(household_data$DateTime1,household_data$Sub_metering_1,  type="l",ylab="Energy sub metering",xlab="")
lines(household_data$DateTime1,household_data$Sub_metering_2,col="red")
lines(household_data$DateTime1,household_data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=1,lty="solid")
dev.off()