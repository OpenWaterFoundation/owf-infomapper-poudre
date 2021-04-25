# Download dairies.
# - this should only need to be done periodically
# - use the file in the OWF GitHub account
# - save the file in 'downloads' and then read and write to make sure GeoJSON uses the latest specification
WebGet(URL="https://raw.githubusercontent.com/OpenWaterFoundation/owf-data-co-dairies/master/data/Colorado-Dairies.geojson",OutputFile="downloads/dairies.geojson")
# Copy to the 'layers' folder.  If clipping to the Poudre is implemented, use a 02* command file.
CopyFile(SourceFile="downloads/dairies.geojson",DestinationFile="layers/dairies.geojson")
