#  Download the Source Water Route Framework for District 3 from OWF's Data page
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-SourceWaterRouteFramework-District03-20180228.geojson",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/00-Download-SourceWaterRouteFramework/swrf-district03.geojson")
#
# Read in SWRF for District 3 (Cache la Poudre)
ReadGeoLayerFromGeoJSON(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/00-Download-SourceWaterRouteFramework/swrf-district03.geojson",GeoLayerID="swrf-district03")
#
# Run commands and then right-click on the layer shown in the Results pane below and select Open Map to make sure layer looks correct
#