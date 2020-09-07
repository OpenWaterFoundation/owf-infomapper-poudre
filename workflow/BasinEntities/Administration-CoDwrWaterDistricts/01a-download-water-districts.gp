# Download Division 1 Water Districts file.
# - output is a layer with water districts for Division 1, and a layer with only Water District 3
# - use the zipped shapefile on the CDSS website and split out Division 1
# - this should only need to be done if setting up a new workspace
WebGet(URL="https://dnrftp.state.co.us/CDSS/GIS/Water_Districts.zip",OutputFile="downloads/Water_Districts.zip")
# Unzip the zip file
UnzipFile(File="downloads/Water_Districts.zip",OutputFolder="downloads/Water_Districts",IfFolderDoesNotExist="Create")
# Read the 'downloads' shapefile, split out Division 1 districts into a new layer (default is GeoPackage format),
# and write to 'layers/'as a GeoJSON file.
ReadGeoLayerFromShapefile(InputFile="downloads/Water_Districts/Water_Districts.shp",GeoLayerID="WaterDistrictsLayer",Name="DWR Water Districts",Description="DWR Water Districts for Division 1")
SplitGeoLayerByAttribute(InputGeoLayerID="WaterDistrictsLayer",AttributeName="DIVISION",IncludeAttributeValues="1",TemporaryFolder="downloads/Water_Districts-split")
# Use the following to troubleshoot the split command if necessary.
# ReadGeoLayersFromGeoPackage(InputFile="downloads/Water_Districts-split/DIVISION_1.gpkg",ReadOneLayer="True",LayerName="DIVISION_1",GeoLayerID="WaterDistrictsLayer")
WriteGeoLayerToGeoJSON(GeoLayerID="WaterDistrictsLayer_DIVISION_1",OutputFile="layers/co-dwr-water-division.geojson")
#
# Create a layer containing only District 3
SplitGeoLayerByAttribute(InputGeoLayerID="WaterDistrictsLayer",AttributeName="DISTRICT",IncludeAttributeValues="3",TemporaryFolder="downloads/Water_Districts-districts-split")
WriteGeoLayerToGeoJSON(GeoLayerID="WaterDistrictsLayer_DISTRICT_3",OutputFile="layers/co-dwr-water-district-3.geojson")
