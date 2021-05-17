# Download Fort Collins Utility Service Area boundary
# - this should only need to be done periodically
# - save the file in 'downloads/' and then copy to 'layers/' folder
#
# The layer is not available on the web.  It was exported using the Export to Shapefile tool from:
#   https://gisweb.fcgov.com/HTML5Viewer/index.html?Viewer=Utility%20Districts
# Then process the shapefile into a GeoJSON.
ReadGeoLayerFromShapefile(InputFile="downloads/FortCollins/Water District Service Areas.shp",GeoLayerID="FortCollinsServiceAreaLayer",Name="Fort Collins Service Area",Description="Fort Collins Service Area from Fort Collins")
WriteGeoLayerToGeoJSON(GeoLayerID="FortCollinsServiceAreaLayer",OutputFile="downloads/fort-collins-boundary.geojson")
CopyFile(SourceFile="downloads/fort-collins-boundary.geojson",DestinationFile="layers/fort-collins-boundary.geojson")
#
# ===========================================
# TODO smalers 2021-05-15 need to use selenium to download
