# Download Division 1 Water Districts file.
# - this should only need to be done periodically
# - use the file on the OWF website since it has already been clipped for Division 1
# - save the file in 'downloads' and then read and write to make sure GeoJSON uses the latest specification
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-WaterDistrictBoundaries-Division01-20180228.geojson",OutputFile="downloads/co-dwr-water-districts-division1.geojson")
# Read the file that was downloaded and then resave to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/co-dwr-water-districts-division1.geojson",GeoLayerID="WaterDistrictsLayer",Name="DWR Water Districts",Description="DWR Water Districts for Division 1")
WriteGeoLayerToGeoJSON(GeoLayerID="WaterDistrictsLayer",OutputFile="layers/co-dwr-water-districts-division1.geojson")