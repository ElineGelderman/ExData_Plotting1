library("data.table")

setwd("C:/Users/u1271491/Downloads/Project_1_Exploratory_Data_Analysis")


# Read data from the file
powerConsumption <- data.table::fread(input = "exdata_data_household_power_consumption/household_power_consumption.txt"
                                      , na.strings="?"         
)


# Filter the data to only have the dates for 2007-02-01 and 2007-02-02
powerConsumption  <- powerConsumption [(Date == "1/2/2007") | (Date == "2/2/2007")]

# Make a POSIXct date capable of being filtered and graphed by time of day
powerConsumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


png("plot2.png", width=480, height=480)

## Plot 2
plot(x = powerConsumption[, dateTime]
     , y = powerConsumption[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()





