# Download municipal boundaries from the Colorado Department of Local Affairs (DOLA)
# https://demography.dola.colorado.gov/gis/gis-data/#gis-data
# Currently commented out because command is not working properly.  Downloaded from TSTool.
# WebGet(URL="https://storage.googleapis.com/co-publicdata/MuniBounds.zip",OutputFile="C:/Users/kms/owf-app-poudre-dashboard-ng/data-prep/municipal-boundaries.zip")
#
# Extract the files
UnzipFile(File="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/01-Download-MunicipalBoundaries/municipal-boundaries.zip",FileType="ZIP",DeleteFile="True")
#
# Read in the municipal boundaries layer (is statewide)
ReadGeoLayerFromShapefile(SpatialDataFile="MuniBounds.shp",GeoLayerID="municipal-boundaries")
#
# Run commands and then right-click on the layer shown in the Results pane below and select Open Map to make sure layer looks correct
#
# Output layer to geojson format
WriteGeoLayerToGeoJSON(GeoLayerID="municipal-boundaries",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/09-Municipal-Population/municipal-boundaries.geojson")
#
#