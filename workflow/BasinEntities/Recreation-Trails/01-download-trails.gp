# Download trails layer.
# - this should only need to be done periodically
# - download from Colorado Information Marketplace
WebGet(URL="https://opendata.fcgov.com/api/geospatial/3j2e-2d5c?method=export&format=GeoJSON",OutputFile="downloads/trails-fortcollins.geojson",Timeout="10")
#
# Don't do this because CIM layer has 15 digits.  Cut back to 5 to reduce file size
# Copy to the 'layers' folder.  If clipping to the Poudre is implemented, use a 02* command file.
#CopyFile(SourceFile="downloads/counties.geojson",DestinationFile="layers/counties.geojson")
#
# Read the file from 'downloads/' and rewrite to 'layers/' to cut back on the number digits
ReadGeoLayerFromGeoJSON(InputFile="downloads/trails-fortcollins.geojson",GeoLayerID="TrailsLayer",Name="Trails",Description="Trails")
WriteGeoLayerToGeoJSON(GeoLayerID="TrailsLayer",OutputFile="layers/trails-fortcollins.geojson")
