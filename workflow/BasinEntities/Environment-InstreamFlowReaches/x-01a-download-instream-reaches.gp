# Download the Instream Flow Reaches for District 3
# - this should only need to be done periodically
# - use the file on the OWF website since it has already been clipped for District 3
# - TODO smalers 2020-06-09 need to update the workflow to download from CDSS website
# - save the file locally and then read and write to make sure GeoJSON file is saved as latest spec
WebGet(URL="http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/data-files/CO-CWCB-InstreamFlowReachesDecreed-District03-20180228.geojson",OutputFile="downloads/instream-reaches.geojson")
# Read the file from 'downloads/' and then write to 'layers/' to make sure the latest GeoJSON spec is used.
ReadGeoLayerFromGeoJSON(InputFile="downloads/instream-reaches.geojson",GeoLayerID="InstreamReachLayer",Name="Instream Reaches",Description="Instream Flow Reaches from CWCB")
WriteGeoLayerToGeoJSON(GeoLayerID="InstreamReachLayer",OutputFile="layers/instream-reaches.geojson")
