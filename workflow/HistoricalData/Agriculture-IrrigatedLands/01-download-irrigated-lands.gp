# Download Division 1 Irrigated Lands files.
# - this should only need to be done periodically
# - use the file on the OWF website since it has already been clipped for District 3
# - save the file in 'downloads' and then read and write to make sure GeoJSON uses the latest specification
#
# Download 1956 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-1956-20180228.geojson",OutputFile="downloads/irrigated-lands-1956.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-1956.geojson",GeoLayerID="IrrigatedLands1956Layer",Name="Irrigated Lands (1956)",Description="Irrigated Lands (1956)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands1956Layer",OutputFile="layers/irrigated-lands-1956.geojson")
#
# Download 1976 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-1976-20180228.geojson",OutputFile="downloads/irrigated-lands-1976.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-1976.geojson",GeoLayerID="IrrigatedLands1976Layer",Name="Irrigated Lands (1976)",Description="Irrigated Lands (1976)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands1976Layer",OutputFile="layers/irrigated-lands-1976.geojson")
#
# Download 1987 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-1987-20180228.geojson",OutputFile="downloads/irrigated-lands-1987.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-1987.geojson",GeoLayerID="IrrigatedLands1987Layer",Name="Irrigated Lands (1987)",Description="Irrigated Lands (1987)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands1987Layer",OutputFile="layers/irrigated-lands-1987.geojson")
#
# Download 1997 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-1997-20180228.geojson",OutputFile="downloads/irrigated-lands-1997.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-1997.geojson",GeoLayerID="IrrigatedLands1997Layer",Name="Irrigated Lands (1997)",Description="Irrigated Lands (1997)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands1997Layer",OutputFile="layers/irrigated-lands-1997.geojson")
#
# Download 2001 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-2001-20180228.geojson",OutputFile="downloads/irrigated-lands-2001.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-2001.geojson",GeoLayerID="IrrigatedLands2001Layer",Name="Irrigated Lands (2001)",Description="Irrigated Lands (2001)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands2001Layer",OutputFile="layers/irrigated-lands-2001.geojson")
#
# Download 2005 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-2005-20180228.geojson",OutputFile="downloads/irrigated-lands-2005.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-2005.geojson",GeoLayerID="IrrigatedLands2005Layer",Name="Irrigated Lands (2005)",Description="Irrigated Lands (2005)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands2005Layer",OutputFile="layers/irrigated-lands-2005.geojson")
#
# Download 2010 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-2010-20180228.geojson",OutputFile="downloads/irrigated-lands-2010.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-2010.geojson",GeoLayerID="IrrigatedLands2010Layer",Name="Irrigated Lands (2010)",Description="Irrigated Lands (2010)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands2010Layer",OutputFile="layers/irrigated-lands-2010.geojson")
#
# Download 2015 Irrigated Lands
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-DWR-IrrigatedLands-District03-2015-20180228.geojson",OutputFile="downloads/irrigated-lands-2015.geojson")
# Read the file from 'downloads/' and rewrite to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/irrigated-lands-2015.geojson",GeoLayerID="IrrigatedLands2015Layer",Name="Irrigated Lands (2015)",Description="Irrigated Lands (2015)")
WriteGeoLayerToGeoJSON(GeoLayerID="IrrigatedLands2015Layer",OutputFile="layers/irrigated-lands-2015.geojson")
