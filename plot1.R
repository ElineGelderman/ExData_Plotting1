library("data.table")

setwd("C:/Users/u1271491/Downloads/Project_1_Exploratory_Data_Analysis")


# Read data from the file
powerConsumption <- data.table::fread(input = "exdata_data_household_power_consumption/household_power_consumption.txt"
                                      , na.strings="?"         
)


# Filter the data to only have the dates for 2007-02-01 and 2007-02-02
powerConsumption  <- powerConsumption [(Date == "1/2/2007") | (Date == "2/2/2007")]


png("plot1.png", width=480, height=480)

## Plot 1
hist(powerConsumption[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


