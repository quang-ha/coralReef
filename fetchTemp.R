devtools::install_github("ropensci/rnoaa")
library("rnoaa")

# Load Token
source('loadNOAAToken.R')

# Search for a station using a bounding box
stations <- ncdc_stations(extent=c(22.0, -83.0, 26.0, -79.0))

# Search for data and get a data.frame
# out <- ncdc(datasetid='NORMAL_DLY', stationid='WPLF1', datatypeid='dly-tmax-normal', startdate = '2010-01-01', enddate = '2010-12-10', limit = 300)
# Print out the data.frame
# print(out$data)

