# Download roundtables file.
# - output is a layer with roundtable boundaries
# - use the zipped shapefile on the CDSS website
# - this should only need to be done if setting up a new workspace
WebGet(URL="https://dnrftp.state.co.us/CDSS/GIS/Basins_IBCC.zip",OutputFile="downloads/Basins_IBCC.zip")
# Unzip the zip file
UnzipFile(File="downloads/Basins_IBCC.zip",OutputFolder="downloads/Basins_IBCC",IfFolderDoesNotExist="Create")
# Read the 'downloads' shapefile, and write to 'layers/'as a GeoJSON file.
ReadGeoLayerFromShapefile(InputFile="downloads/Basins_IBCC/Basins_IBCC.shp",GeoLayerID="RoundtablesLayer",Name="IBCC Roundtables",Description="IBCC Roundtables")
WriteGeoLayerToGeoJSON(GeoLayerID="RoundtablesLayer",OutputFile="layers/roundtables.geojson")
