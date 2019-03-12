# 09-Municipal-Population #

This folder accesses the municipal boundaries layer downloaded via command files in the `01-Download-MunicipalBoundaries` 
folder and links population data to it. 

The R file, municipal-population-dola.R, directly accesses data from the Colorado Department of Local Affairs (DOLA)'s State 
Demography Office.  The Demography Office provides historical population data for municipalities and counties and also provides 
population forecast estimates for counties up to the year 2050. 

The following data processing steps are performed:

1.  Data are directly accessed from [DOLA's website](https://demography.dola.colorado.gov/data/).  The direct download accesses the "County and Municipal Population Time Series 1980-2017" category and the "county-muni-timeseries.csv" file.
2.  County and unincorporated areas population data are filtered from the dataset and misspellings or incomplete municipality names are corrected.
3.  2010-2017 data are processed separately because some municipalities that are within more than one county have multiple population numbers that need to be combined.
4.  Data are subset to only include 2017 data (the most current year).
5.  The spatial data file, municipal-boundaries.geojson, created in folder `01-Download-MunicipalBoundaries` is read in.
6.  The population data are merged with the spatial data; the population data will become part of the spatial file's attribute table.
7.  The spatial data with the added population data are saved in GeoJSON format as municipal-population-2017.geojson.

