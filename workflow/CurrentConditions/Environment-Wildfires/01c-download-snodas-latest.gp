# Download the latest SNODAS GeoJSON
# - this needs to be done daily and processed until the SNODAS server-side code is updated to
#   output the current GeoJSON specification file
# - save the file locally and then read and write to make sure GeoJSON file is saved as latest spec
WebGet(URL="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",OutputFile="downloads/snodas.geojson")
# Read the file from 'downloads/' and then write to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/snodas.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
WriteGeoLayerToGeoJSON(GeoLayerID="SnodasLayer",OutputFile="layers/snodas.geojson")
