fetchTemperatureFromNOAA <- function(boundingbox=NULL, 
                                     startdate=NULL, enddate=NULL,
                                     datatypeid=NULL) {
  #' Function to fetch dataset Daily Summaries from NOAA
  #' Further details on the dataset is available 
  #' at https://www.ncdc.noaa.gov/cdo-web/datasets
  #'
  #' You need to have loaded a registered NOAA token 
  #' before calling this function. On how to obtain the 
  #' Token, check http://www.ncdc.noaa.gov/cdo-web/token
  #' 
  #' This functions wrap around rnoaa package, which is
  #' available at https://github.com/ropensci/rnoaa
  #' For information on how to use the Token in R, 
  #' check the link to the rnoaa's GitHub page.
  #' 
  #'   boundingbox - a vector contains four points in 
  #'     lat, lon of bottom-left and top-right of the
  #'     search box
  #'   startdate - string format in 'YYYY-MM-DD' for 
  #'     when to start fetching the data 
  #'   enddate - string format in 'YYYY-MM-DD' for 
  #'     when to stop fetching the data
  #'   datatypeid - different core values available
  #'     from the Daily Summaries dataset. Options 
  #'     include TMIN - minimum temperature and 
  #'     TMAX - maximum temperature. Further
  #'     details can be found at NOAA's web page.   
  
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
    # Suppresswarnings to skip errors printing our when fetching missing data
    suppressWarnings(out <- ncdc(datasetid='GHCND', stationid=sid, datatypeid=datatypeid, 
                                 startdate=startdate, enddate=enddate, limit=300))
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
