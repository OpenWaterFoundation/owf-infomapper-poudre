# Download legislative districts layer.
# - this should only need to be done periodically, when district boundaries change
# - download from Colorado Information Marketplace
WebGet(URL="https://www.colorado.gov/pacific/sites/default/files/Final_Resubmitted_House_Plan_Shapefile.zip",OutputFile="downloads/co-state-house-districts-2011.zip",Timeout="10")
UnzipFile(File="downloads/co-state-house-districts-2011.zip",OutputFolder="downloads")
WebGet(URL="https://www.colorado.gov/pacific/sites/default/files/Final_Resubmitted_Senate_Plan_Shapefile.zip",OutputFile="downloads/co-state-senate-districts-2011.zip",Timeout="10")
UnzipFile(File="downloads/co-state-senate-districts-2011.zip",OutputFolder="downloads")
#
ReadGeoLayerFromShapefile(InputFile="downloads/House Final Resubmitted Plan.shp",GeoLayerID="StateHouseLegislativeDistrictsLayer",Name="State House Districts (2011)",Description="Colorado State House district boundaries (2011)")
WriteGeoLayerToGeoJSON(GeoLayerID="StateHouseLegislativeDistrictsLayer",OutputFile="layers/co-state-house-districts-2011.geojson")
ReadGeoLayerFromShapefile(InputFile="downloads/Senate Resubmitted Plan.shp",GeoLayerID="StateSenateLegislativeDistrictsLayer",Name="State Senate Districts (2011)",Description="Colorado State Senate district boundaries (2011)")
WriteGeoLayerToGeoJSON(GeoLayerID="StateSenateLegislativeDistrictsLayer",OutputFile="layers/co-state-senate-districts-2011.geojson")
