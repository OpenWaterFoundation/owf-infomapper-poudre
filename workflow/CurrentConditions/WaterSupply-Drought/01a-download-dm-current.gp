# Download the current Drought Monitor and create a GeoJSON file
# - this needs to be done at least weekly and processed until the Drought Monitor server-side code is updated to
#   output a GeoJSON file
# - save the file locally and then read and write to make sure GeoJSON file is saved as latest spec
WebGet(URL="https://droughtmonitor.unl.edu/data/shapefiles_m/USDM_current_M.zip",OutputFile="downloads/USDM_current_M.zip")
# =====================================================
# Process the shapefile.
# Unzip the shapefile.
UnzipFile(File="downloads/USDM_current_M.zip",OutputFolder="downloads/USDM_current",IfFolderDoesNotExist="Create")
# List the files in order to get the latest filename
ListFiles(Folder="downloads/USDM_current",IncludePatterns="*.shp",ListCount="-1",ListProperty1="USDM_current_shp")
# Read the file from 'downloads/' and then write to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromShapefile(InputFile="downloads/USDM_current/${USDM_current_shp}",GeoLayerID="USDM_current",Name="US Drought Monitor",Description="US Drought Monitor")
# Write the file as GeoJSON
WriteGeoLayerToGeoJSON(GeoLayerID="USDM_current",OutputFile="layers/USDM_current_M.geojson")
# The resulting file will be uploaded to data.openwaterfoundation.org by build-util/harvest-data.bash
# - this is what is used by the map configuration