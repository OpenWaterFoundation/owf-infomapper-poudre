# Download Burn Area Emergency Response data from the USFS archive
# - East Troublesome wildfire 2020
# - see:  https://fsapps.nwcg.gov/baer/baer-imagery-support-data-download 
#
# Raster
CreateFolder(Folder="downloads/USFS-EastTroublesome-BAER",CreateParentFolders="True",IfFolderExists="Ignore")
WebGet(URL="https://fsapps.nwcg.gov/baer/sites/baer/files/east_troublesome_sbs.zip",OutputFile="downloads/USFS-EastTroublesome-BAER/east_troublesome_sbs.zip",Timeout="10")
UnzipFile(File="downloads/USFS-EastTroublesome-BAER/east_troublesome_sbs.zip",OutputFolder="downloads/USFS-EastTroublesome-BAER",IfFolderDoesNotExist="Warn")
#
# Read the file from 'downloads/' and rewrite to 'layers/' as GeoJSON
# - TODO smalers 2021-05-18 decide whether GeoJSON format will be used
#ReadGeoLayerFromShapefile(InputFile="downloads/EastTroublesome_SBS_shapefile/EastTroublesome_SBS20201111.shp",GeoLayerID="EastTroublesomeSBSLayer",Name="East Troublesome Burn Severity",Description="East Troublesome Burn Severity")
#WriteGeoLayerToGeoJSON(GeoLayerID="EastTroublesomeSBSLayer",OutputFile="layers/east-troublesome-sbs.geojson")
#
# Read the raster layer
# - read the combined layer, which includes RMP burn area
#ReadRasterGeoLayerFromFile(InputFile="downloads/USFS-EastTroublesome-BAER/EAST_TROUBLESOME_sbs/EAST_TROUBLESOME_sbs.tif",GeoLayerID="EastTroublesomeSBSRasterLayer",Name="East Troublesome Burn Severity (raster)",Description="East Troublesome Burn Severity (raster)")
ReadRasterGeoLayerFromFile(InputFile="downloads/USFS-EastTroublesome-BAER/EAST_TROUBLESOME_sbs/EAST_TROUBLESOME_sbs_Combine_FS_NPS.tif",GeoLayerID="EastTroublesomeSBSRasterLayer",Name="East Troublesome Burn Severity (raster)",Description="East Troublesome Burn Severity (raster)")
# ReadRasterGeoLayerFromFile(InputFile="downloads/EastTroublesome_SBS_raster2/CPSBS20201111.tif",GeoLayerID="EastTroublesomeSBSRasterLayer",Name="East Troublesome Burn Severity (raster)",Description="East Troublesome Burn Severity (raster)")
ChangeRasterGeoLayerCRS(GeoLayerID="EastTroublesomeSBSRasterLayer",CRS="EPSG:4326")
# WriteRasterGeoLayerToFile(GeoLayerID="EastTroublesomeSBSRasterLayer",OutputFile="layers/east-troublesome-sbs.tif",OutputCRS="EPSG:4326")
WriteRasterGeoLayerToFile(GeoLayerID="EastTroublesomeSBSRasterLayer",OutputFile="layers/east-troublesome-sbs.tif")
ReadRasterGeoLayerFromFile(InputFile="layers/east-troublesome-sbs.tif",GeoLayerID="EastTroublesomeSBSRasterLayer2",Name="East Troublesome Burn Severity (raster)",Description="East Troublesome Burn Severity (raster)")
