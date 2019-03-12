# Linking municipal boundaries spatial file to population data from DOLA

# Clear the workspace of any previous work
rm(list=ls())

# Set working directory
setwd("C:\\Users\\kms\\App-Poudre-Portal\\git-repos\\owf-app-poudre-dashboard-workflow\\process\\09-Municipal-Population\\")

# Set global option for reading files
options(stringsAsFactors=FALSE)

# Load required packages
library(rgdal)  # allows for saving dataframe as geojson
library(dplyr)  # for data manipulation
library(geojsonio) # allows for reading in geojson
library(curl)  # fread() function allows for accessing data directly from the web
library(readr) # allows for accessing data directly from the web

#Load required packages
require(data.table)
require(tidyr)
require(stringr)


# HISTORICAL POPULATION DATA (1980-2017)
# Data available for municipalities and counties

# 1) Download data
# Data are from DOLA at https://demography.dola.colorado.gov/data/.  The direct download accesses the "County and 
# Municipal Population Time Series 1980-2017" category and the county-muni-timeseries.csv file.	
historical_population = read.csv("https://storage.googleapis.com/co-publicdata/county-muni-timeseries.csv")
head(historical_population)


# 2) Clean up data
# Filter data to only include municipalities and get rid of unincorporated areas
muni_population = historical_population %>%
  filter(placefips > 0) %>%
  filter(placefips != 99990) %>%
  arrange(municipalityname)	#Sort data by municipality

# Clean up misspelled municipalities
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Vo", "Vona")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="turita", "Naturita")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Mount Crested Butte/G", "Mount Crested Butte")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Massa", "Manassa")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Igcio", "Ignacio")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Idaho Sprgs", "Idaho Springs")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Green Mtn Falls (Total)", "Green Mountain Falls (Total)")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Green Mtn. Falls (Part)", "Green Mountain Falls (Part)")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Green Mtn. Falls(part)", "Green Mountain Falls (part)")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Grada", "Granada")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Flager", "Flagler")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="City of Creede", "Creede")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="City of Castle Pines", "Castle Pines")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="City Of Castle Pines", "Castle Pines")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Bue Vista", "Buena Vista")
muni_population$municipalityname = replace(muni_population$municipalityname, 
  muni_population$municipalityname=="Bonza City", "Bonanza City")


# Need to separate 2010-2017 data from the rest because for some cities there is a "Total" that 
# shouldn't be added to the other "part"s
total_muni_pop = muni_population %>%
  filter(year >= 2010) %>% 
  rename(TotalPopulation = totalpopulation) %>%
  rename(Year = year) %>%
  rename(FIPS_ID = placefips)

# For the cities that have "Total" in the name, keep "Total" and remove "Part"
total_muni_pop = total_muni_pop[!like(total_muni_pop$municipalityname, "Part"),]

# Remove "(Total)" from the name
total_muni_pop$municipalityname = sub(" (Total)", "", total_muni_pop$municipalityname, fixed=TRUE)


# Create subset of data from 1980-2009, which will then be merged with the 2010-2017 data
muni_pop2 = muni_population %>%
  filter(year < 2010) %>%
  filter(!is.na(totalpopulation))

# Remove "(part)" from the name of some cities
muni_pop2$municipalityname = sub(" (part)", "", muni_pop2$municipalityname, fixed=TRUE)

# Group by municipality name and year and then add population together for each year
muni_pop3 = muni_pop2 %>%
  arrange(municipalityname, year) %>%
  group_by(municipalityname, year) %>%
  summarise(TotalPopulation = sum(totalpopulation, na.rm=TRUE))

# Create table of municipality name and placefips to join with the data 
muni_pop4 = muni_pop2 %>%
  select(placefips, municipalityname) %>%
  distinct()
# Join the tables together and rename column names
muni_pop3 = left_join(muni_pop3, muni_pop4)
muni_pop3 = muni_pop3 %>%
  rename(Year = year) %>%
  rename(FIPS_ID = placefips)

# Now join 1980-2009 data (muni_pop3) with the 2010-2017 data (total_muni_pop)
muni_historical = full_join(muni_pop3, total_muni_pop)

# Sort by municipality
muni_historical = muni_historical %>%
  arrange(Year) %>%	# Sort by year
  rename(MunicipalityName = municipalityname) %>%  # Change column name
  rename(Population = TotalPopulation) %>%  # Change column name
  select(MunicipalityName, FIPS_ID, Year, Population)	#Remove unneeded columns


# 3) Subset data to get 2017 population only
pop_2017 = muni_historical %>%
  filter (Year == 2017)


# 4) Read in spatial data file of municipal boundaries
cities = geojson_read("C:\\Users\\kms\\App-Poudre-Portal\\git-repos\\owf-app-poudre-dashboard-workflow\\process\\01-Download-MunicipalBoundaries\\municipal-boundaries.geojson", what = "sp")


# 5) Join population data to spatial file
cities@data = cities@data %>%
  left_join(pop_2017, by = c("first_city" = "MunicipalityName")) %>%
  rename(Pop2017 = Population) %>%
  select(c(first_city, city, Pop2017)) %>%  # 'city' is the FIPS Id; keep this because it preserves leading zeroes
  rename(FIPS_ID = city)


# 6) Export to geojson
writeOGR(cities, 'municipal-population-2017.geojson','municipal-pop-2017', driver='GeoJSON')

