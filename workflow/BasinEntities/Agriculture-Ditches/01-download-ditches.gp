# Download District 3 ditch service area files.
# - this should only need to be done periodically
# - use the file on the OWF website since it has already been clipped for District 3
# - save the file in 'downloads' and then read and write to make sure GeoJSON uses the latest specification
#
# Download 1956 Ditch Service Area
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-DitchServiceAreas-District03-1956-20180228.geojson",OutputFile="downloads/ditch-service-areas-1956.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/ditch-service-areas-1956.geojson",GeoLayerID="DitchServiceArea1956Layer",Name="Ditch Service Area (1956)",Description="Ditch Service Area (1956)")
WriteGeoLayerToGeoJSON(GeoLayerID="DitchServiceArea1956Layer",OutputFile="layers/ditch-service-areas-1956.geojson")
#
# Download 1976 Ditch Service Area
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-DitchServiceAreas-District03-1976-20180228.geojson",OutputFile="downloads/ditch-service-areas-1976.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/ditch-service-areas-1976.geojson",GeoLayerID="DitchServiceArea1976Layer",Name="Ditch Service Area (1976)",Description="Ditch Service Area (1976)")
WriteGeoLayerToGeoJSON(GeoLayerID="DitchServiceArea1976Layer",OutputFile="layers/ditch-service-areas-1976.geojson")
#
# Download 1987 Ditch Service Area
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-DitchServiceAreas-District03-1987-20180228.geojson",OutputFile="downloads/ditch-service-areas-1987.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/ditch-service-areas-1987.geojson",GeoLayerID="DitchServiceArea1987Layer",Name="Ditch Service Area (1987)",Description="Ditch Service Area (1987)")
WriteGeoLayerToGeoJSON(GeoLayerID="DitchServiceArea1987Layer",OutputFile="layers/ditch-service-areas-1987.geojson")
#
# Download 2001 Ditch Service Area
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-DitchServiceAreas-District03-2001-20180228.geojson",OutputFile="downloads/ditch-service-areas-2001.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/ditch-service-areas-2001.geojson",GeoLayerID="DitchServiceArea2001Layer",Name="Ditch Service Area (2001)",Description="Ditch Service Area (2001)")
WriteGeoLayerToGeoJSON(GeoLayerID="DitchServiceArea2001Layer",OutputFile="layers/ditch-service-areas-2001.geojson")
#
# Download 2005 Ditch Service Area
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-DitchServiceAreas-District03-2005-20180228.geojson",OutputFile="downloads/ditch-service-areas-2005.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/ditch-service-areas-2005.geojson",GeoLayerID="DitchServiceArea2005Layer",Name="Ditch Service Area (2005)",Description="Ditch Service Area (2005)")
WriteGeoLayerToGeoJSON(GeoLayerID="DitchServiceArea2005Layer",OutputFile="layers/ditch-service-areas-2005.geojson")
