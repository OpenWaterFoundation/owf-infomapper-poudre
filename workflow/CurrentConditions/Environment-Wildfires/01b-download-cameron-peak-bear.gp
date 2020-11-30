# Download Burn Area Emergency Response data from Google Drive
# - use the Google Drive web interface to get the link to files (right click on file and "Get link")
# - then edit the url to change to "user command" syntax
#
# Raster
CreateFolder(Folder="downloads/CameronPeak_SBS_raster",CreateParentFolders="True",IfFolderExists="Ignore")
WebGet(URL="https://drive.google.com/uc?id=1STVetT24HnwOL6Te3EY9mlR6N7cJ6sxl&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tfw",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1VoQur3TRibwWM3dfGjxQ81N2xVyrAS2P&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1KmJXKVI94cSDWUWaTfFF2rWYf9HqV6NR&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif.aux.xml",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1Gg-IHSmZ6pbL-03H98cGz8T02DZrogkp&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif.ovr",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=17_Dw7hlyGgasasklf4xzr1AIwp7SSAPX&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif.vat.cpg",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1NvdWicWI2sxU7iXU8eTU_pHcQyzW1Cnr&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif.vat.dbf",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1IEQr90GjSdz8BH_q-ZWAVukVqz162UAm&export=download",OutputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif.xml",Timeout="10")
# KMZ (raster)
CreateFolder(Folder="downloads/CameronPeak_SBS_KMZ",CreateParentFolders="True",IfFolderExists="Ignore")
WebGet(URL="https://drive.google.com/uc?id=18-3myE9Ka9qu_Nw2n0I3kA2_V84zyscn&export=download",OutputFile="downloads/CameronPeak_SBS_KMZ/CameronPeakBAER_SBS_4ClassRaster.kmz",Timeout="10")
# PDF, for comparison
CreateFolder(Folder="downloads/CameronPeak_SBS_Maps",CreateParentFolders="True",IfFolderExists="Ignore")
WebGet(URL="https://drive.google.com/uc?id=1QHAjBakZ8aFS71stMffHSja1nDYjcJDg&export=download",OutputFile="downloads/CameronPeak_SBS_Maps/CameronPeak_Round2_SBS_36x48_PUBLIC.pdf",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1T2ZlepfcHyZIArQ9DBYXYAlsxJYwo1_4&export=download",OutputFile="downloads/CameronPeak_SBS_Maps/CameronPeak_Round2_SBS_36x48_PUBLIC.jpg",Timeout="10")
# Shapefile
CreateFolder(Folder="downloads/CameronPeak_SBS_shapefile",CreateParentFolders="True",IfFolderExists="Ignore")
WebGet(URL="https://drive.google.com/uc?id=11F_34EiRe6v5N_SmAhuw_kp2kc3mW5Zx&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.cpg",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1Q_dtohFdvdM0TnnMLEF0GSoF5rT-Y43j&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.dbf",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1rSSKS8sUmCWdqYTRs8BF_3Qt5nV15PLy&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.prj",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=18jPRFsQFkXv-On8Z47RGnnla7tIZqCY9&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.sbn",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1GXdcx9Wh7_QppQElvO0ZiqAUcoWZWMId&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.sbx",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=11GusxarfS5EISF_OuXFJy2sDdwZSqbCX&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.shp",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=19dYBsJUeDM8N7P2Qw2TC98nRz4_4-MfP&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.shp.xml",Timeout="10")
WebGet(URL="https://drive.google.com/uc?id=1OJlkXx8TmQfy4ceTZNRK2AxX1xdF8U2M&export=download",OutputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.shx",Timeout="10")
#
# Read the file from 'downloads/' and rewrite to 'layers/' as GeoJSON
ReadGeoLayerFromShapefile(InputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.shp",GeoLayerID="CameronPeakSBSLayer",Name="Cameron Peak Burn Severity",Description="Cameron Peak Burn Severity")
WriteGeoLayerToGeoJSON(GeoLayerID="CameronPeakSBSLayer",OutputFile="layers/cameron-peak-sbs.geojson")
#
# Read the raster layer
ReadRasterGeoLayerFromFile(InputFile="downloads/CameronPeak_SBS_raster/CPSBS20201111.tif",GeoLayerID="CameronPeakSBSRasterLayer",Name="Cameron Peak Burn Severity (raster)",Description="Cameron Peak Burn Severity (raster)")
# ReadRasterGeoLayerFromFile(InputFile="downloads/CameronPeak_SBS_raster2/CPSBS20201111.tif",GeoLayerID="CameronPeakSBSRasterLayer",Name="Cameron Peak Burn Severity (raster)",Description="Cameron Peak Burn Severity (raster)")
ChangeRasterGeoLayerCRS(GeoLayerID="CameronPeakSBSRasterLayer",CRS="EPSG:4326")
# WriteRasterGeoLayerToFile(GeoLayerID="CameronPeakSBSRasterLayer",OutputFile="layers/cameron-peak-sbs.tif",OutputCRS="EPSG:4326")
WriteRasterGeoLayerToFile(GeoLayerID="CameronPeakSBSRasterLayer",OutputFile="layers/cameron-peak-sbs.tif")
ReadRasterGeoLayerFromFile(InputFile="layers/cameron-peak-sbs.tif",GeoLayerID="CameronPeakSBSRasterLayer2",Name="Cameron Peak Burn Severity (raster)",Description="Cameron Peak Burn Severity (raster)")