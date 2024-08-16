---
title: "Case Study: Bike Sharing"
author: "Bayram Turgut"
date: "2024-08-08"
output: html_document
---

  
  
install.packages("tidyverse")
install.packages("lubridate")
install.packages("skimr")
install.packages("dplyr")
install.packages("janitor")  


    
library(tidyverse)  # loads ggplot2, tibble, tidyr, readr, purrr, dplyr, stringr, and forcats, helps wrangle data
# -- Attaching packages --------------------------------------- tidyverse 2.0.0 --
  # ✔ dplyr     1.1.4     ✔ readr     2.1.5
  # ✔ forcats   1.0.0     ✔ stringr   1.5.1
  # ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
  # ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
  # ✔ purrr     1.0.2  
# -- Conflicts ------------------------------------------tidyverse_conflicts() --
  # x dplyr::filter() masks stats::filter()
  # x dplyr::lag()    masks stats::lag()

library(lubridate) #helps wrangle date attributes

#     date, intersect, setdiff, union
library(skimr) #get summary data library(janitor)

#     chisq.test, fisher.test
library(dplyr)

#chisq.test, fisher.test
library(janitor)
# STEP 1: COLLECT DATA
# ====================================================
  Trips_Aug23 <- read_csv('202308-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )

  Trips_Sep23 <- read_csv('202309-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )

  Trips_Oct23 <- read_csv('202310-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Nov23 <- read_csv('202311-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Dec23 <- read_csv('202312-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Jan24 <- read_csv('202401-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Feb24 <- read_csv('202402-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Mar24 <- read_csv('202403-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Apr24 <- read_csv('202404-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_May24 <- read_csv('202405-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_Jun24 <- read_csv('202406-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )
  
  Trips_July24 <- read_csv('202407-divvy-tripdata.csv')
  # cols(
  #   ride_id = col_character(),
  #   rideable_type = col_character(),
  #   started_at = col_datetime(format = ""),
  #   ended_at = col_datetime(format = ""),
  #   start_station_name = col_character(),
  #   start_station_id = col_character(),
  #   end_station_name = col_character(),
  #   end_station_id = col_character(),
  #   start_lat = col_double(),
  #   start_lng = col_double(),
  #   end_lat = col_double(),
  #   end_lng = col_double(),
  #   member_casual = col_character()
  # )

#  STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE
#==================================================== # Compare column names each of the files # While the names don’t have to be in the same order, they DO need to match perfectly before we can use a command to join them into one file
colnames(Trips_Aug23)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"   

colnames(Trips_Sep23)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Oct23)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Nov23)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Dec23)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Jan24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Feb24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"  

colnames(Trips_Mar24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Apr24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_May24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_Jun24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"

colnames(Trips_July24)
# [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
# [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
# [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
# [13] "member_casual"


# Inspect the dataframes and look for inconguencies
# ====================================================
str(Trips_Aug23)
# spc_tbl_ [771,693 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
# $ ride_id           : chr [1:771693] "903C30C2D810A53B" "F2FB18A98E110A2B" "D0DEC7C94E4663DA" "E0DDDC5F84747ED9" ...
# $ rideable_type     : chr [1:771693] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
# $ started_at        : POSIXct[1:771693], format: "2023-08-19 15:41:53" "2023-08-18 15:30:18" "2023-08-30 16:15:08" ...
# $ ended_at          : POSIXct[1:771693], format: "2023-08-19 15:53:36" "2023-08-18 15:45:25" "2023-08-30 16:27:37" ...
# $ start_station_name: chr [1:771693] "LaSalle St & Illinois St" "Clark St & Randolph St" "Clark St & Randolph St" "Wells St & Elm St" ...
# $ start_station_id  : chr [1:771693] "13430" "TA1305000030" "TA1305000030" "KA1504000135" ...
# $ end_station_name  : chr [1:771693] "Clark St & Elm St" NA NA NA ...
# $ end_station_id    : chr [1:771693] "TA1307000039" NA NA NA ...
# $ start_lat         : num [1:771693] 41.9 41.9 41.9 41.9 41.9 ...
# $ start_lng         : num [1:771693] -87.6 -87.6 -87.6 -87.6 -87.6 ...
# $ end_lat           : num [1:771693] 41.9 41.9 41.9 41.9 41.9 ...
# $ end_lng           : num [1:771693] -87.6 -87.6 -87.6 -87.6 -87.7 ...
# $ member_casual     : chr [1:771693] "member" "member" "member" "member" ...
# - attr(*, "spec")=
#   .. cols(
#   ..   ride_id = col_character(),
#   ..   rideable_type = col_character(),
#   ..   started_at = col_datetime(format = ""),
#   ..   ended_at = col_datetime(format = ""),
#   ..   start_station_name = col_character(),
#   ..   start_station_id = col_character(),
#   ..   end_station_name = col_character(),
#   ..   end_station_id = col_character(),
#   ..   start_lat = col_double(),
#   ..   start_lng = col_double(),
#   ..   end_lat = col_double(),
#   ..   end_lng = col_double(),
#   ..   member_casual = col_character()
#   .. )
# - attr(*, "problems")=<externalptr>

  
str(Trips_Sep23)
# spc_tbl_ [666,371 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
# $ ride_id           : chr [1:666371] "011C1903BF4E2E28" "87DB80E048A1BF9F" "7C2EB7AF669066E3" "57D197B010269CE3" ...
# $ rideable_type     : chr [1:666371] "classic_bike" "classic_bike" "electric_bike" "classic_bike" ...
# $ started_at        : POSIXct[1:666371], format: "2023-09-23 00:27:50" "2023-09-02 09:26:43" "2023-09-25 18:30:11" ...
# $ ended_at          : POSIXct[1:666371], format: "2023-09-23 00:33:27" "2023-09-02 09:38:19" "2023-09-25 18:41:39" ...
# $ start_station_name: chr [1:666371] "Halsted St & Wrightwood Ave" "Clark St & Drummond Pl" "Financial Pl & Ida B Wells Dr" "Clark St & Drummond Pl" ...
# $ start_station_id  : chr [1:666371] "TA1309000061" "TA1307000142" "SL-010" "TA1307000142" ...
# $ end_station_name  : chr [1:666371] "Sheffield Ave & Wellington Ave" "Racine Ave & Fullerton Ave" "Racine Ave & 15th St" "Racine Ave & Belmont Ave" ...
# $ end_station_id    : chr [1:666371] "TA1307000052" "TA1306000026" "13304" "TA1308000019" ...
# $ start_lat         : num [1:666371] 41.9 41.9 41.9 41.9 41.9 ...
# $ start_lng         : num [1:666371] -87.6 -87.6 -87.6 -87.6 -87.6 ...
# $ end_lat           : num [1:666371] 41.9 41.9 41.9 41.9 41.9 ...
# $ end_lng           : num [1:666371] -87.7 -87.7 -87.7 -87.7 -87.7 ...
# $ member_casual     : chr [1:666371] "member" "member" "member" "member" ...
# - attr(*, "spec")=
#   .. cols(
#   ..   ride_id = col_character(),
#   ..   rideable_type = col_character(),
#   ..   started_at = col_datetime(format = ""),
#   ..   ended_at = col_datetime(format = ""),
#   ..   start_station_name = col_character(),
#   ..   start_station_id = col_character(),
#   ..   end_station_name = col_character(),
#   ..   end_station_id = col_character(),
#   ..   start_lat = col_double(),
#   ..   start_lng = col_double(),
#   ..   end_lat = col_double(),
#   ..   end_lng = col_double(),
#   ..   member_casual = col_character()
#   .. )
# - attr(*, "problems")=<externalptr>


str(Trips_Oct23)
# spc_tbl_ [537,113 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
# $ ride_id           : chr [1:537113] "4449097279F8BBE7" "9CF060543CA7B439" "667F21F4D6BDE69C" "F92714CC6B019B96" ...
# $ rideable_type     : chr [1:537113] "classic_bike" "electric_bike" "electric_bike" "classic_bike" ...
# $ started_at        : POSIXct[1:537113], format: "2023-10-08 10:36:26" "2023-10-11 17:23:59" "2023-10-12 07:02:33" ...
# $ ended_at          : POSIXct[1:537113], format: "2023-10-08 10:49:19" "2023-10-11 17:36:08" "2023-10-12 07:06:53" ...
# $ start_station_name: chr [1:537113] "Orleans St & Chestnut St (NEXT Apts)" "Desplaines St & Kinzie St" "Orleans St & Chestnut St (NEXT Apts)" "Desplaines St & Kinzie St" ...
# $ start_station_id  : chr [1:537113] "620" "TA1306000003" "620" "TA1306000003" ...
# $ end_station_name  : chr [1:537113] "Sheffield Ave & Webster Ave" "Sheffield Ave & Webster Ave" "Franklin St & Lake St" "Franklin St & Lake St" ...
# $ end_station_id    : chr [1:537113] "TA1309000033" "TA1309000033" "TA1307000111" "TA1307000111" ...
# $ start_lat         : num [1:537113] 41.9 41.9 41.9 41.9 41.9 ...
# $ start_lng         : num [1:537113] -87.6 -87.6 -87.6 -87.6 -87.6 ...
# $ end_lat           : num [1:537113] 41.9 41.9 41.9 41.9 41.9 ...
# $ end_lng           : num [1:537113] -87.7 -87.7 -87.6 -87.6 -87.6 ...
# $ member_casual     : chr [1:537113] "member" "member" "member" "member" ...
# - attr(*, "spec")=
#   .. cols(
#   ..   ride_id = col_character(),
#   ..   rideable_type = col_character(),
#   ..   started_at = col_datetime(format = ""),
#   ..   ended_at = col_datetime(format = ""),
#   ..   start_station_name = col_character(),
#   ..   start_station_id = col_character(),
#   ..   end_station_name = col_character(),
#   ..   end_station_id = col_character(),
#   ..   start_lat = col_double(),
#   ..   start_lng = col_double(),
#   ..   end_lat = col_double(),
#   ..   end_lng = col_double(),
#   ..   member_casual = col_character()
#   .. )
# - attr(*, "problems")=<externalptr>


#...







# we can compare column datatype across all dataframe by using compare_df_cols when we have large dataset, that would be more easy

compare_df_cols(Trips_Aug23, Trips_Sep23, Trips_Oct23, Trips_Nov23, Trips_Dec23, Trips_Jan24, Trips_Feb24, Trips_Mar24, Trips_Apr24, Trips_May24, Trips_Jun24, Trips_July24, return = "mismatch")

#[1] column_name  Trips_Aug23  Trips_Sep23  Trips_Oct23  Trips_Nov23  Trips_Dec23  Trips_Jan24 
#[8] Trips_Feb24  Trips_Mar24  Trips_Apr24  Trips_May24  Trips_Jun24  Trips_July24
#<0 rows> (or 0-length row.names)

#Stack individual data frames into one big data frame
#Remove unused column Rename Columns
all_trips <- bind_rows(Trips_Aug23, Trips_Sep23, Trips_Oct23, Trips_Nov23, Trips_Dec23, Trips_Jan24, Trips_Feb24, Trips_Mar24, Trips_Apr24, Trips_May24, Trips_Jun24, Trips_July24)
all_trips <- all_trips %>%
  select(-c(start_lat, start_lng, end_lat, end_lng))
all_trips <- all_trips %>%  rename(trip_id= ride_id, ride_type =rideable_type, start_time = started_at,end_time =ended_at, from_station_name = start_station_name, from_station_id = start_station_id, to_station_name = end_station_name, to_station_id = end_station_id, usertype = member_casual)

#STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#====================================================== # Inspect the new table that has been created
 colnames(all_trips) 
#List of column names
# [1] "trip_id"           "ride_type"         "start_time"        "end_time"          "from_station_name"
# [6] "from_station_id"   "to_station_name"   "to_station_id"     "usertype"
dim(all_trips) #Dimensions of the data frame
## [1] 5715693       9
head(all_trips) #See the first 6 rows of data frame.
# A tibble: 6 × 9
# trip_id          ride_type     start_time          end_time            from_station_name from_station_id
# <chr>            <chr>         <dttm>              <dttm>              <chr>             <chr>          
# 1 903C30C2D810A53B electric_bike 2023-08-19 15:41:53 2023-08-19 15:53:36 LaSalle St & Ill… 13430          
# 2 F2FB18A98E110A2B electric_bike 2023-08-18 15:30:18 2023-08-18 15:45:25 Clark St & Rando… TA1305000030   
# 3 D0DEC7C94E4663DA electric_bike 2023-08-30 16:15:08 2023-08-30 16:27:37 Clark St & Rando… TA1305000030   
# 4 E0DDDC5F84747ED9 electric_bike 2023-08-30 16:24:07 2023-08-30 16:33:34 Wells St & Elm St KA1504000135   
# 5 7797A4874BA260CA electric_bike 2023-08-22 15:59:44 2023-08-22 16:20:38 Clark St & Rando… TA1305000030   
# 6 DF4DE734EBC4DF66 electric_bike 2023-08-24 12:27:24 2023-08-24 12:54:59 Milwaukee Ave & … 428            

str(all_trips) #See list of columns and data types (numeric, character, etc)
# tibble [5,715,693 × 9] (S3: tbl_df/tbl/data.frame)
#  $ trip_id          : chr [1:5715693] "903C30C2D810A53B" "F2FB18A98E110A2B" "D0DEC7C94E4663DA" "E0DDDC5F84747ED9" ...
#  $ ride_type        : chr [1:5715693] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
#  $ start_time       : POSIXct[1:5715693], format: "2023-08-19 15:41:53" "2023-08-18 15:30:18" "2023-08-30 16:15:08" ...
#  $ end_time         : POSIXct[1:5715693], format: "2023-08-19 15:53:36" "2023-08-18 15:45:25" "2023-08-30 16:27:37" ...
#  $ from_station_name: chr [1:5715693] "LaSalle St & Illinois St" "Clark St & Randolph St" "Clark St & Randolph St" "Wells St & Elm St" ...
#  $ from_station_id  : chr [1:5715693] "13430" "TA1305000030" "TA1305000030" "KA1504000135" ...
#  $ to_station_name  : chr [1:5715693] "Clark St & Elm St" NA NA NA ...
#  $ to_station_id    : chr [1:5715693] "TA1307000039" NA NA NA ...
#  $ usertype         : chr [1:5715693] "member" "member" "member" "member" ...


summary(all_trips) #Statistical summary of data. Mainly for numerics
#    trip_id           ride_type           start_time                        end_time                     
#  Length:5715693     Length:5715693     Min.   :2023-08-01 00:00:06.00   Min.   :2023-08-01 00:01:03.00  
#  Class :character   Class :character   1st Qu.:2023-09-30 16:47:31.00   1st Qu.:2023-09-30 17:08:29.00  
#  Mode  :character   Mode  :character   Median :2024-02-21 19:00:28.00   Median :2024-02-21 19:13:49.00  
#                                        Mean   :2024-02-03 06:01:03.05   Mean   :2024-02-03 06:19:05.11  
#                                        3rd Qu.:2024-06-02 20:07:32.05   3rd Qu.:2024-06-02 20:30:45.56  
#                                        Max.   :2024-07-31 23:56:29.40   Max.   :2024-07-31 23:59:56.74  
#  from_station_name  from_station_id    to_station_name    to_station_id        usertype        
#  Length:5715693     Length:5715693     Length:5715693     Length:5715693     Length:5715693    
#  Class :character   Class :character   Class :character   Class :character   Class :character  
#  Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  




skim(all_trips) #get summary of data, check missing data
# ── Data Summary ────────────────────────
#                            Values   
# Name                       all_trips
# Number of rows             5715693  
# Number of columns          9        
# _______________________             
# Column type frequency:              
#   character                7        
#   POSIXct                  2        
# ________________________            
# Group variables            None     
# 
# ── Variable type: character ──────────────────────────────────────────────────────────────────────────────
#   skim_variable     n_missing complete_rate min max empty n_unique whitespace
# 1 trip_id                   0         1      16  16     0  5715482          0
# 2 ride_type                 0         1      11  13     0        3          0
# 3 from_station_name    947025         0.834  10  64     0     1705          0
# 4 from_station_id      947025         0.834   3  14     0     1669          0
# 5 to_station_name      989476         0.827  10  64     0     1719          0
# 6 to_station_id        989476         0.827   3  36     0     1681          0
# 7 usertype                  0         1       6   6     0        2          0
# 
# ── Variable type: POSIXct ────────────────────────────────────────────────────────────────────────────────
#   skim_variable n_missing complete_rate min                 max                 median             
# 1 start_time            0             1 2023-08-01 00:00:06 2024-07-31 23:56:29 2024-02-21 19:00:28
# 2 end_time              0             1 2023-08-01 00:01:03 2024-07-31 23:59:56 2024-02-21 19:13:49
#   n_unique
# 1  5100084
# 2  5107236




# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level
# Add a “ride_length” calculation to all_trips (in seconds)
# Convert “ride_length” from Factor to numeric so we can run calculations on the data

is.factor(all_trips$ride_length)
all_trips$date <- as.Date(all_trips$start_time) #The default format is yyyy- mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
  all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
  all_trips$ride_length <- difftime(all_trips$end_time,all_trips$start_time)
 
# [1] FALSE
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)
# [1] TRUE
# Remove “bad” data
# The dataframe includes a few hundred entries when bikes were taken
# out of docks and checked for quality by Divvy or ride_length was negative

skim(all_trips$ride_length)
# ── Data Summary ────────────────────────
#                            Values               
# Name                       all_trips$ride_length
# Number of rows             5715693              
# Number of columns          1                    
# _______________________                         
# Column type frequency:                          
#   difftime                 1                    
# ________________________                        
# Group variables            None                 
# 
# ── Variable type: difftime ───────────────────────────────────────────────────────────────────────────────
#   skim_variable n_missing complete_rate min          max          median   n_unique
# 1 data                  0             1 -999391 secs 5909344 secs 585 secs  1157618



all_trips_v2 <- all_trips[!(all_trips$ride_length<0),]

skim(all_trips_v2)
# ── Data Summary ────────────────────────
#                            Values      
# Name                       all_trips_v2
# Number of rows             5715289     
# Number of columns          15          
# _______________________                
# Column type frequency:                 
#   character                11          
#   Date                     1           
#   difftime                 1           
#   POSIXct                  2           
# ________________________               
# Group variables            None        
# 
# ── Variable type: character ──────────────────────────────────────────────────────────────────────────────
#    skim_variable     n_missing complete_rate min max empty n_unique whitespace
#  1 trip_id                   0         1      16  16     0  5715078          0
#  2 ride_type                 0         1      11  13     0        3          0
#  3 from_station_name    946791         0.834  10  64     0     1705          0
#  4 from_station_id      946791         0.834   3  14     0     1669          0
#  5 to_station_name      989234         0.827  10  64     0     1719          0
#  6 to_station_id        989234         0.827   3  36     0     1681          0
#  7 usertype                  0         1       6   6     0        2          0
#  8 month                     0         1       2   2     0       12          0
#  9 day                       0         1       2   2     0       31          0
# 10 year                      0         1       4   4     0        2          0
# 11 day_of_week               0         1       6   9     0        7          0
# 
# ── Variable type: Date ───────────────────────────────────────────────────────────────────────────────────
#   skim_variable n_missing complete_rate min        max        median     n_unique
# 1 date                  0             1 2023-08-01 2024-07-31 2024-02-21      366
# 
# ── Variable type: difftime ───────────────────────────────────────────────────────────────────────────────
#   skim_variable n_missing complete_rate min    max          median   n_unique
# 1 ride_length           0             1 0 secs 5909344 secs 585 secs  1157445
# 
# ── Variable type: POSIXct ────────────────────────────────────────────────────────────────────────────────
#   skim_variable n_missing complete_rate min                 max                 median             
# 1 start_time            0             1 2023-08-01 00:00:06 2024-07-31 23:56:29 2024-02-21 19:02:36
# 2 end_time              0             1 2023-08-01 00:01:03 2024-07-31 23:59:56 2024-02-21 19:17:23
#   n_unique
# 1  5099778
# 2  5106942


#STEP 4: CONDUCT DESCRIPTIVE ANALYSIS
#===================================== # Descriptive analysis on ride_length (all figures in seconds)
#Export to CSV file for further analysis

write.csv(all_trips_v2, "data.csv")

summary(all_trips_v2$ride_length)
# Length    Class     Mode 
# 5715289 difftime  numeric 




