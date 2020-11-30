# Download active wildfire perimeters layer.
# - this command file no longer needs to be used because the current and historical layers are directly
#   accessed via web services
# - need to run daily at least
# - download from National Interagency Fire Center
WebGet(URL="https://opendata.arcgis.com/datasets/5da472c6d27b4b67970acc7b5044c862_0.geojson",OutputFile="downloads/wildfire-perimeters.geojson",Timeout="10")
#
# Clip the layer to Colorado border.
# Exact border, from:  https://gist.github.com/JoshuaCarroll/49630cbeeb254a49986e939a26672e9c
# CreateGeoLayerFromGeometry(NewGeoLayerID="ColoradoBoundaryLayer",Name="Colorado Boundary Layer",Description="Colorado boundary, with buffer.",GeometryFormat="WKT",GeometryData="POLYGON((-109.0448 37.0004,-102.0424 36.9949,-102.0534 41.0006,-109.0489 40.9996,-109.0448 37.0004,-109.0448 37.0004))",CRS="EPSG:4326")
# Buffered with .5 degrees in each direction to include some out of state fires
CreateGeoLayerFromGeometry(NewGeoLayerID="ColoradoBoundaryLayer",Name="Colorado Boundary Layer",Description="Colorado boundary, with buffer.",GeometryFormat="WKT",GeometryData="POLYGON((-109.5448 36.5004,-101.5424 36.4949,-101.5534 41.5006,-109.5489 41.4996,-109.5448 36.5004,-109.5448 36.5004))",CRS="EPSG:4326")
#
# Read the file from 'downloads/' and rewrite to 'layers/' to cut back on the number digits
ReadGeoLayerFromGeoJSON(InputFile="downloads/wildfire-perimeters.geojson",GeoLayerID="WildfirePerimeters0Layer",Name="Wildfire Perimeters",Description="Wildfire Perimeters, USA")
ClipGeoLayer(InputGeoLayerID="WildfirePerimeters0Layer",ClippingGeoLayerID="ColoradoBoundaryLayer",OutputGeoLayerID="WildfirePerimetersLayer",Name="Wildfire Perimeters",Description="Wildfire perimieters for active fires")
WriteGeoLayerToGeoJSON(GeoLayerID="WildfirePerimetersLayer",OutputFile="layers/wildfire-perimeters.geojson")
