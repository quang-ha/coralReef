devtools::install_github("ropensci/rnoaa")
library("rnoaa")

# Load Token
source('loadNOAAToken.R')

# Search for a station using a bounding box
stations <- ncdc_stations(datasetid='NORMAL_DLY', extent=c(24.5, -81.4, 25.2, -80.3))

# Obtain the stations' IDs
stations_ids <- stations$data$id

# Loop through each stations and obtain the reading
for (sid in stations_ids) {
  print(sid)
  out <- ncdc(datasetid='GHCND', stationid=sid, datatypeid='TMAX', startdate = '1983-01-01', enddate = '1983-01-31', limit = 300)
  if (!is.null(out$meta$totalCount)) {
    print(out$data)    
  }
}


