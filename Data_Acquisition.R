#--------------------------------------------------------------------------------#
# MLB Data Acquisition from Baseball Savant
#--------------------------------------------------------------------------------#

# Install the package "mlbr"
#install.packages("remotes")
#remotes::install_github("pontsuyu/mlbr", upgrade = "never")

# Call packages
library(mlbr)
library(stringr)

# Collect the Data: 
# Statcast pitch-by-pitch data on all regular season games in each year
mlb2015 = sc_pbp(start_date = "2015-04-05", end_date = "2015-10-04") # 702,301 observations
mlb2016 = sc_pbp(start_date = "2016-04-03", end_date = "2016-10-02") # 715,821 obs.
mlb2017 = sc_pbp(start_date = "2017-04-02", end_date = "2017-10-01") # 721,244 obs.
mlb2018 = sc_pbp(start_date = "2018-03-29", end_date = "2018-09-30") # 720,660 obs.
mlb2019 = sc_pbp(start_date = "2019-03-28", end_date = "2019-09-29") # 731,784 obs.

