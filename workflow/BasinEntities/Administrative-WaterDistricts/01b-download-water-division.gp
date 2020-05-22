# Download Division 1 boundary file.
# - this should only need to be done if setting up a new workspace
# - use the file on the OWF website since it has already been clipped for Division 1
# - save the file locally and then read and write to make sure GeoJSON version 1 is saved as latest spec
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-WaterDivisionBoundaries-Division01-20180228.geojson",OutputFile="layers/download-co-dwr-water-division.geojson")
# Read the file that was downloaded and then resave to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="layers/download-co-dwr-water-division.geojson",GeoLayerID="WaterDivisionLayer",Name="DWR Division 1 Boundary",Description="DWR Division 1 Boundary")
WriteGeoLayerToGeoJSON(GeoLayerID="WaterDivisionLayer",OutputFile="layers/co-dwr-water-division.geojson")