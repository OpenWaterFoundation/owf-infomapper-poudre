# CDSS Ditches in the Cache la Poudre River basin (water district 3)

# Processing of data downloaded from CDSS to only include active ditches in district 3
# and save data as a geojson file.

# Clear the workspace of any previous work
rm(list=ls())

# Set working directory
setwd("C:\\Users\\kms\\App-Poudre-Portal\\git-repos\\owf-app-poudre-dashboard-workflow\\process\\05-Download-ActiveDitches\\")

# Set global option for reading files
options(stringsAsFactors=FALSE)

# Load required packages
library(rgdal)  # allows for saving dataframe as geojson
library(dplyr)  # for data manipulation
library(readr) # allows for accessing data directly from the web

# Get data from CDSS's REST web services; use the Active Structures Generator
ditches = read.csv("https://dnrweb.state.co.us/DWR/DwrApiService/api/v2/structures/?format=csv&waterDistrict=3", 
                   skip = 2, header=TRUE)
head(ditches)

ditches = ditches %>%
  filter (structureType == "DITCH") %>%
  filter (ciuCode %in% c("Active Structure with contemporary diversion records (A)", 
                          "Active structure but diversion records are not maintained (U)") ) %>%
  filter (latdecdeg != "")

str(ditches)
# Now down to 343 structures

# Write as geojson
# Coordinates in columns 34 (latdecdeg) and 35 (longdecdeg)
# Make sure coordinates are numeric; if not, use as.numeric()
ditches.SP  = SpatialPointsDataFrame(ditches[,c(35, 34)],ditches[,-c(35, 34)])
str(ditches.SP) # Now is class SpatialPointsDataFrame
writeOGR(ditches.SP, 'active-ditches.geojson','ditches', driver='GeoJSON')




