# install sql library
install.packages("sqldf")
library(sqldf)


fname <- "household_power_consumption.txt"

# read the records from data file where records are on date : '1/2/2007' OR Date = '2/2/2007'"
my_sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
household_data <- read.csv2.sql(fname, my_sql)

#plot the data into plot1.png
png("plot1.png",width=480,height=480)
hist(household_data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", ylim=c(0,1200), xlim=c(0,6))
dev.off()