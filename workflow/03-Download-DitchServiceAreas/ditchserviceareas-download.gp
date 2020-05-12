# Download the Ditch Service Areas layer for District 3 from OWF's Data page
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-DitchServiceAreas-District03-2005-20180228.geojson",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/03-Download-DitchServiceAreas/ditchserviceareas-district03.geojson")
#
# Read in Ditch Service Areas layer for District 3 (Cache la Poudre River)
ReadGeoLayerFromGeoJSON(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/03-Download-DitchServiceAreas/ditchserviceareas-district03.geojson",GeoLayerID="ditchserviceareas-district03")
#
# Run commands and then right-click on the layer shown in the Results pane below and select Open Map to make sure layer looks correct
#