# Download the Source Water Route Framework for District 3 from OWF's Data page
# - this should only need to be done periodically
# - use the file on the OWF website since it has already been clipped for District 3
# - save the file locally and then read and write to make sure GeoJSON file is saved as latest spec
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-SourceWaterRouteFramework-District03-20180228.geojson",OutputFile="layers/download-stream-reaches.geojson")
# Read the file that was downloaded and then resave to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="layers/download-stream-reaches.geojson",GeoLayerID="StreamReachLayer",Name="Stream Reaches",Description="Source Water Route Framework (SWRF) from DWR")
WriteGeoLayerToGeoJSON(GeoLayerID="StreamReachLayer",OutputFile="layers/stream-reaches.geojson")