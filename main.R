devtools::install_github("ropensci/rnoaa")
library("rnoaa")
library("anytime") # For converting character to Datetime

# Load Token
source('loadNOAAToken.R')

# Obtain data from NOAA
tmax_vals <- fetchTemperatureFromNOAA(boundingbox=c(24.5, -81.4, 25.2, -80.3), 
                                      startdate='1983-01-01', enddate='1983-01-10',
                                      datatypeid='TMAX')

# Plot the first station
x <- anytime(tmax_vals$date[tmax_vals$stationid==tmax_vals$stationid[1]])
y <- tmax_vals$value[tmax_vals$stationid==tmax_vals$stationid[1]]
plot(x, y, xlab='Date', ylab='TMAX', type='p', main=tmax_vals$stationid[1])
lines(x, y)
