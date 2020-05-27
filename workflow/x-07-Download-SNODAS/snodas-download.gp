# Download the most recent SNODAS layer from the CDSS SNODAS Tools website
# http://snodas.cdss.state.co.us/app/index.html
# Not working; used TSTool to download.  Uncomment next line for now.
#WebGet(URL="http://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/07-Download-SNODAS/snodas.geojson")
#
# Read in the SNODAS layer (is statewide)
ReadGeoLayerFromGeoJSON(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/07-Download-SNODAS/snodas.geojson",GeoLayerID="snodas")
#
# Convert coordinate reference system (CRS) from NAD83 UTM Zone 13N to WGS84
SetGeoLayerCRS(GeoLayerID="snodas",CRS="EPSG:4326")
#
# Run commands and then right-click on the layer shown in the Results pane below and select Open Map to make sure layer looks correct
#
# Save layer with new crs in geojson format
WriteGeoLayerToGeoJSON(GeoLayerID="snodas",OutputFile="snodas_wgs84.geojson")
#
#