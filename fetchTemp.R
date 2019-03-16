fetchTemperatureFromNOAA <- function(boundingbox=NULL, 
                                     startdate=NULL, enddate=NULL,
                                     datatypeid=NULL) {
  # Search for list of stations using a bounding box
  stations <- ncdc_stations(datasetid='GHCND', extent=boundingbox)
  
  # Obtain the stations' IDs
  stations_ids <- stations$data$id
  
  # Create empty vectors to store the results
  df_dates = c()
  df_stations = c()
  df_values = c()
  
  # Loop through each stations and obtain the reading
  for (sid in stations_ids) {
    # Obtain data from the Daily Summaries dataset from NOAA
    out <- ncdc(datasetid='GHCND', stationid=sid, datatypeid=datatypeid, 
                startdate=startdate, enddate=enddate, limit=300)
    # Only printout stations with available data
    if (!is.null(out$meta$totalCount)) {
      # Append to the lists
      df_dates <- c(df_dates, out$data$date)
      df_stations <- c(df_stations, out$data$station)
      df_values <- c(df_values, out$data$value)
    }
  }
  
  # Create a data frame to store the results
  df <- data.frame(df_dates, df_stations, df_values)
  colnames(df) <- c("date", "stationid", "value")
  
  # Return the dataframe
  return(df)
}
