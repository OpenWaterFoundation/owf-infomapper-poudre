# Download the HUC boundaries from USGS
# - this should only need to be done periodically
# - read from the Esri file GeoDatabase and write to GeoJSON
#
# First download the zipped geodatabase for HUC-2 that includes the Poudre.
FTPGet(RemoteSite="rockyftp.cr.usgs.gov",RemoteFolder="/vdelivery/Datasets/Staged/Hydrography/WBD/HU2/GDB",FilePattern="WBD_10_HU2_GDB.zip",IncludeSubfolders=" ",DestinationFolder="downloads",TransferMode=" ",DryRun=" ")
#
# Unzip the geodatabase to downloads since it contains a top-level folder
UnzipFile(File="downloads/WBD_10_HU2_GDB.zip",OutputFolder="downloads",IfFolderDoesNotExist="Create")
#
# Read the HUC basins at various levels for the Poudre and save to GeoJSON format
#
# HUC2 - Missouri: 10
ReadGeoLayersFromFGDB(InputFolder="downloads/WBD_10_HU2_GDB.gdb",ReadOnlyOneFeatureClass="TRUE",FeatureClass="WBDHU2",GeoLayerID="HUC2Layer",Name="HUC2 10",Description="HUC2 10 Missouri Basin from USGS")
WriteGeoLayerToGeoJSON(GeoLayerID="HUC2Layer",OutputFile="layers/huc2.geojson",OutputPrecision="3")
#
# HUC4 - South Platte: 1019
ReadGeoLayersFromFGDB(InputFolder="downloads/WBD_10_HU2_GDB.gdb",ReadOnlyOneFeatureClass="TRUE",FeatureClass="WBDHU4",Query="HUC4 = '1019'",GeoLayerID="HUC4Layer",Name="HUC4 1019",Description="HUC4 1019 South Platte Basin from USGS")
WriteGeoLayerToGeoJSON(GeoLayerID="HUC4Layer",OutputFile="layers/huc4.geojson",OutputPrecision="5")
#
# HUC6 - same as HUC4 with no further subdivision:  101900
#
# HUC8 - Cache La Poudre: 10190007
ReadGeoLayersFromFGDB(InputFolder="downloads/WBD_10_HU2_GDB.gdb",ReadOnlyOneFeatureClass="TRUE",FeatureClass="WBDHU8",Query="HUC8 = '10190007'",GeoLayerID="HUC8Layer",Name="HUC8 10190007",Description="HUC8 10190007 Cache La Poudre Basin from USGS")
WriteGeoLayerToGeoJSON(GeoLayerID="HUC8Layer",OutputFile="layers/huc8.geojson",OutputPrecision="5")
#
# HUC10 - Cache La Poudre: 10190007xx
ReadGeoLayersFromFGDB(InputFolder="downloads/WBD_10_HU2_GDB.gdb",ReadOnlyOneFeatureClass="TRUE",FeatureClass="WBDHU10",Query="HUC10 LIKE '10190007%'",GeoLayerID="HUC10Layer",Name="HUC10 10190007xx",Description="HUC10 10190007xx Cache La Poudre Basin from USGS")
WriteGeoLayerToGeoJSON(GeoLayerID="HUC10Layer",OutputFile="layers/huc10.geojson",OutputPrecision="5")
#
# HUC12 - Cache La Poudre: 10190007xxxx
ReadGeoLayersFromFGDB(InputFolder="downloads/WBD_10_HU2_GDB.gdb",ReadOnlyOneFeatureClass="TRUE",FeatureClass="WBDHU12",Query="HUC12 LIKE '10190007%'",GeoLayerID="HUC12Layer",Name="HUC12 10190007xxxx",Description="HUC12 10190007xxxx Cache La Poudre Basin from USGS")
WriteGeoLayerToGeoJSON(GeoLayerID="HUC12Layer",OutputFile="layers/huc12.geojson",OutputPrecision="5")
#
# HUC14 - Cache La Poudre: 10190007aabbcc
# - nothing available
#
# HUC16 - Cache La Poudre: 10190007aabbccdd
# - nothing available
