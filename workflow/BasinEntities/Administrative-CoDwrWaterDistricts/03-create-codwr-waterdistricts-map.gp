# Create a GeoMapProject file for Division 1 water districts
# - read the previously downloaded layer file
# - output to the dist/info-mapper folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Administrative-CoDwrWaterDistricts")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  WaterDistrictsProject
# - GeoMapID:  WaterDistrictsMap
CreateGeoMapProject(NewGeoMapProjectID="WaterDistrictsProject",ProjectType="SingleMap",Name="CO Division 1 Water Districts",Description="Colorado Division 1 water districts for water administration.",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="WaterDistrictsMap",Name="CO Division 1 Water Districts",Description="Colorado Division 1 water districts for water administration.",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.385,40,8'")
AddGeoMapToGeoMapProject(GeoMapProjectID="WaterDistrictsProject",GeoMapID="WaterDistrictsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Water division:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-division.geojson",GeoLayerID="WaterDivisionLayer",Name="CO DWR Division 1",Description="Water Division 1 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDivisionLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDivisionLayerView",Name="CO DWR Division 1",Description="Boundary for Division 1 from the Colorado Division of Water Resources",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDivisionLayerView",Name="Colorize divisions",Description="Symbol for the division",ClassificationAttribute="DIV",Properties="classificationFile:'layers/co-dwr-water-division-classify-division.csv'")
# = = = = = = = = = =
# Water districts:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-districts-division1.geojson",GeoLayerID="WaterDistrictsLayer",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictsLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictsLayerView",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictsLayerView",Name="Colorize districts",Description="Show each water district in a different color.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-districts-division1-classify-district.csv")
# = = = = = = = = = =
# DWR offices:  read layer and add to the same layer group
# GeoLayerViewGroupID: WaterDistrictsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-offices-division1.geojson",GeoLayerID="DWROfficesLayer",Name="CO DWR Division 1 Offices",Description="DWR Offices for Division 1")
AddGeoLayerViewToGeoMap(GeoLayerID="DWROfficesLayer",GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="DWROfficesLayerView",Name="CO DWR Division 1 Offices",Description="Offices for Division 1",InsertPosition="Top")
SetGeoLayerViewSingleSymbol(GeoMapID="WaterDistrictsMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="DWROfficesLayerView",Name="Use marker image for DWR offices",Description="Use marker image for DWR offices",Properties="symbolImage:/img/office-building.png")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="WaterDistrictsProject",Indent="2",OutputFile="codwr-waterdistricts-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="codwr-waterdistricts-map.json",DestinationFile="${MapFolder}/codwr-waterdistricts-map.json")
CopyFile(SourceFile="layers/co-dwr-offices-division1.geojson",DestinationFile="${MapFolder}/layers/co-dwr-offices-division1.geojson")
CopyFile(SourceFile="layers/co-dwr-water-districts-division1.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-districts-division1.geojson")
CopyFile(SourceFile="layers/co-dwr-water-districts-division1-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-districts-division1-classify-district.csv")
CopyFile(SourceFile="layers/co-dwr-water-division.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-division.geojson")
CopyFile(SourceFile="layers/co-dwr-water-division-classify-division.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-division-classify-division.csv")
