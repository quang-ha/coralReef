
# Coral Bleaching Group Project - GE585 Spring 2019

Quang-Thinh Ha - qth20@bu.edu

Christopher Reyes - chrislr@bu.edu

Shelby Sundquist - sundqshe@bu.edu

James Fifer - jfifer@bu.edu 

Kathryn Wheeler - kiwheel@bu.edu

# Using fetchTemp.R

The file `main.R` should include a minimal working example on how to fetch the temperature data from NOAA datasets.

Having obtained the token from http://www.ncdc.noaa.gov/cdo-web/token, create another R file `loadNOAAToken.R` in the current working directory which contains the following line:

```
options(noaakey = "YOUR-NOAA-KEYS")
```

And source that file in your main scripts. Other methods for utilizing the Token can be found at https://github.com/ropensci/rnoaa.