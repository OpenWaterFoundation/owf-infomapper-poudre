#  Read in burn areas shapefiles from CPRW
ReadGeoLayerFromShapefile(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/BAERperimeter20120703.shp",GeoLayerID="BAERperimeter")
ReadGeoLayerFromShapefile(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/BAERperimeter20120703Owner.shp",GeoLayerID="BAERperimeterOwner")
ReadGeoLayerFromShapefile(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/co_hewlett_burnarea2012.shp",GeoLayerID="hewlett-burnarea")
ReadGeoLayerFromShapefile(SpatialDataFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/FirePerimeter20120626.shp",GeoLayerID="FirePerimeter")
#
# Convert coordinate reference system to WGS 84 for all layers
SetGeoLayerCRS(GeoLayerID="BAERperimeter",CRS="EPSG:4326")
SetGeoLayerCRS(GeoLayerID="BAERperimeterOwner",CRS="EPSG:4326")
SetGeoLayerCRS(GeoLayerID="hewlett-burnarea",CRS="EPSG:4326")
SetGeoLayerCRS(GeoLayerID="FirePerimeter",CRS="EPSG:4326")
#
# Run commands and then right-click on the layer shown in the Results pane below and select Open Map to make sure layer looks correct
#
# Save layers in GeoJSON format
WriteGeoLayerToGeoJSON(GeoLayerID="BAERperimeter",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/BAERperimeter20120703.geojson")
WriteGeoLayerToGeoJSON(GeoLayerID="BAERperimeterOwner",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/BAERperimeter20120703Owner.geojson")
WriteGeoLayerToGeoJSON(GeoLayerID="hewlett-burnarea",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/co_hewlett_burnarea2012.geojson")
WriteGeoLayerToGeoJSON(GeoLayerID="FirePerimeter",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/08-BurnAreas/FirePerimeter20120626.geojson")
#
#