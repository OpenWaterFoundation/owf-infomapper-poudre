# Download counties layer.
# - this should only need to be done periodically
# - download from Colorado Information Marketplace
WebGet(URL="https://data.colorado.gov/resource/ahgn-r8s5.geojson",OutputFile="downloads/counties.geojson",Timeout="10")
# Copy to the 'layers' folder.  If clipping to the Poudre is implemented, use a 02* command file.
CopyFile(SourceFile="downloads/counties.geojson",DestinationFile="layers/counties.geojson")