library('data.table')
path = '/home/abhishekdubey/Downloads/exdata_data_household_power_consumption' ##provide the path to the data folder
df <- fread(file.path(path, 'household_power_consumption.txt'), sep = ';') ##reading the data
df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)
plot(df[, dateTime], df[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(df[, dateTime], df[, Sub_metering_2],col="red")
lines(df[, dateTime], df[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
