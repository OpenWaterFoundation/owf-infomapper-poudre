# Download legislative districts layer.
# - this should only need to be done periodically, when district boundaries change
# - download from Colorado Independent Redistricting Commissions website
WebGet(URL="https://redistricting.colorado.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBcjhEIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ce9e9fcf6b39c1f7d8ea318e727d1e0ca8f19a92/2021_Approved_House_Plan_w_Final_Adjustments.zip",OutputFile="downloads/co-state-house-districts-2021.zip",Timeout="10")
UnzipFile(File="downloads/co-state-house-districts-2021.zip",OutputFolder="downloads")
WebGet(URL="https://redistricting.colorado.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBc0VEIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3e163d6928a7c388874e81cb0dda49ee2b644d33/2021_Approved_Senate_Plan_w_Final_Adjustments.zip",OutputFile="downloads/co-state-senate-districts-2021.zip",Timeout="10")
UnzipFile(File="downloads/co-state-senate-districts-2021.zip",OutputFolder="downloads")
#
ReadGeoLayerFromShapefile(InputFile="downloads/2021_Approved_House_Plan_w_Final_Adjustments/2021_Approved_House_Plan_w_Final_Adjustments.shp",GeoLayerID="StateHouseLegislativeDistrictsLayer",Name="State House Districts (2021)",Description="Colorado State House district boundaries (2021)")
WriteGeoLayerToGeoJSON(GeoLayerID="StateHouseLegislativeDistrictsLayer",OutputFile="layers/co-state-house-districts-2021.geojson")
ReadGeoLayerFromShapefile(InputFile="downloads/2021_Approved_Senate_Plan_w_Final_Adjustments/2021_Approved_Senate_Plan_w_Final_Adjustments.shp",GeoLayerID="StateSenateLegislativeDistrictsLayer",Name="State Senate Districts (2021)",Description="Colorado State Senate district boundaries (2021)")
WriteGeoLayerToGeoJSON(GeoLayerID="StateSenateLegislativeDistrictsLayer",OutputFile="layers/co-state-senate-districts-2021.geojson")
