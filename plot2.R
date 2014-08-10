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

#plot the data into plot1.png
png("plot2.png",width=480,height=480)
plot(household_data$DateTime1,household_data$Global_active_power,  type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()