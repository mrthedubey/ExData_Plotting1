library('data.table')
path = '/home/abhishekdubey/Downloads/exdata_data_household_power_consumption' ##provide the path to the data folder
df <- fread(file.path(path, 'household_power_consumption.txt'), sep = ';') ##reading the data
df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)
plot(x = df[, dateTime]
     , y = df[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()