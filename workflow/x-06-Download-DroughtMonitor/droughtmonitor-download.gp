# Download the most recent Drought Monitor layer from the U.S. Drought Monitor website
# https://droughtmonitor.unl.edu/Data/GISData.aspx
WebGet(URL="https://droughtmonitor.unl.edu/data/shapefiles_m/USDM_current_M.zip",OutputFile="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/06-Download-DroughtMonitor/drought-monitor.zip")
#
# Extract the files
UnzipFile(File="C:/Users/kms/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/process/06-Download-DroughtMonitor/drought-monitor.zip",FileType="ZIP",DeleteFile="True")
#
# Read in the Drought Monitor layer (is nationwide)
ReadGeoLayerFromShapefile(SpatialDataFile="USDM_20190305.shp",GeoLayerID="drought-monitor")
#
# Run commands and then right-click on the layer shown in the Results pane below and select Open Map to make sure layer looks correct
#
# Output layer to geojson format
WriteGeoLayerToGeoJSON(GeoLayerID="drought-monitor",OutputFile="drought-monitor.geojson")
#
#