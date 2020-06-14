# 01-Download-MunicipalBoundaries #

This folder contains TSTool and GeoProcessor command files for downloading Colorado municipal boundaries.

The command files should be run in the following order:

1.  municipal-boundaries-download.TSTool -- this will download municipal boundaries from the Colorado Department of Local Affairs (DOLA) as a zipped file.
2.  municipal-boundaries-download.gp -- this takes the downloaded zipped file, extracts the files, and saves the spatial data in GeoJSON format.

**2019-03-11**:  This data download uses TSTool to initially download the spatial files because the GeoProcessor 
is not currently able to download the data.  Future fixes to the GeoProcessor should fix this bug and will likely 
eliminate the need for the TSTool file.