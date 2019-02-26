library('data.table')
path = '/home/abhishekdubey/Downloads/exdata_data_household_power_consumption' ##provide the path to the data folder
df <- fread(file.path(path, 'household_power_consumption.txt'), sep = ';') ##reading the data
df$Date <- as.Date(df$Date, '%d/%m/%Y')
df_sub <- df[(df$Date >= '2007-02-01') & (df$Date <= '2007-02-02'), ]
plot.new()
png('plot1.png', width = 480, height = 480)
hist(as.numeric(as.character(df_sub$Global_active_power)), main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'red')
dev.off()










































