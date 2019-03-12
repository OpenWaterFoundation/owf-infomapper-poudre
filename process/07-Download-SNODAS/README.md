# 01-Download-SNODAS #

This folder contains TSTool and GeoProcessor command files for downloading Snow Data Assimilation System (SNODAS) data products for Colorado water supply basins.
SNODAS data are processed daily to calculate Snow Water Equivalent (SWE) and Snow Coverage statistics.

The command files should be run in the following order:

1.  snodas-download.TSTool -- this downloads data from the CDSS SNODAS Tools website (from the Data tab, choose the Daily Data Latest Date Example in GeoJSON format) in GeoJSON format.
2.  snodas-download.gp -- this takes the downloaded geojson file and changes the coordinate reference system (CRS) from NAD83 UTM Zone 13N to WGS84 so that the spatial layers match other data in this repository.  The layer is then saved again in GeoJSON format.

**2019-03-11**:  This data download uses TSTool to initially download the spatial file because the GeoProcessor 
is not currently able to download the data for unknown reasons.  Future fixes to the GeoProcessor should fix this bug and will likely 
eliminate the need for the TSTool file.