# Download the latest SNODAS GeoJSON
# - this command file is no longer needed because the GeoJSON file on the State's server is the correct format
#   (keep the file around in case it is needed again in the future)
# - this needs to be done daily and processed until the SNODAS server-side code is updated to
#   output the current GeoJSON specification file
# - save the file locally and then read and write to make sure GeoJSON file is saved as latest spec
WebGet(URL="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",OutputFile="downloads/snodas.geojson")
WebGet(URL="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.zip",OutputFile="downloads/snodas.zip")
# =====================================================
# Process the GeoJSON.
# Read the file from 'downloads/' and then write to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/snodas.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
# Write the file in latest GeoJSON spec using SNODAS system filename
WriteGeoLayerToGeoJSON(GeoLayerID="SnodasLayer",OutputFile="layers/SnowpackStatisticsByDate_LatestDate_geojson.geojson")
# The resulting file will be uploaded to data.openwaterfoundation.org by build-util/harvest-data.bash
# - this is what is used by the map configuration
# =====================================================
# Process the shapefile.
# Unzip the shapefile.
UnzipFile(File="downloads/snodas.zip",OutputFolder="downloads/snodas-shp",IfFolderDoesNotExist="Create")
# Read the file from 'downloads/' and then write to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromShapefile(InputFile="downloads/snodas-shp/SnowpackStatisticsByDate_LatestDate.shp",GeoLayerID="SnodasFromShpLayer",Name="Snowpack (SNODAS), from shapefile",Description="Snowpack from SNODAS, from shapefile")
# Write the file in latest GeoJSON spec using SNODAS system filename
WriteGeoLayerToGeoJSON(GeoLayerID="SnodasFromShpLayer",OutputFile="layers/SnowpackStatisticsByDate_LatestDate.geojson")
# The resulting file will be uploaded to data.openwaterfoundation.org by build-util/harvest-data.bash
# - this is what is used by the map configuration
