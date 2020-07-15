# Create a GeoMapProject file for municipalities
# - read the previously downloaded layer file
# - output to the dist/info-mapper folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Municipal-Municipalities")
# Municipal boundaries causes the app to freeze.  Only include for testing.
SetProperty(PropertyName="IncludeBoundaries",PropertyType="str",PropertyValue="true")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  MunicipalitiesProject
# - GeoMapID:  MunicipalitiesMap
CreateGeoMapProject(NewGeoMapProjectID="MunicipalitiesProject",ProjectType="SingleMap",Name="Poudre Basin Municipalities",Description="Poudre Basin Municipalities",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="MunicipalitiesMap",Name="Poudre Basin Municipalities",Description="Poudre Basin Municipalities",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10'")
AddGeoMapToGeoMapProject(GeoMapProjectID="MunicipalitiesProject",GeoMapID="MunicipalitiesMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administrative-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../Administrative-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 evaluate whether to include this
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches.geojson")
#ReadGeoLayerFromGeoJSON(InputFile="layers/stream-reaches.geojson",GeoLayerID="StreamReachesLayer",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
#AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="StreamReachesGroup",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="selectedInitial: true",InsertPosition="Top")
#AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
#SetGeoLayerViewSingleSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="weight:2")
## SetGeoLayerViewCategorizedSymbol(GeoMapID="StreamReachesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Municipal boundaries:  read layer and add to a layer view group.
# - TODO smalers 2020-06-13 this seems to hang the app when in production
# GeoLayerViewGroupID: MunicipalBoundariesGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/municipal-boundaries.geojson",GeoLayerID="MunicipalBoundariesLayer",Name="Colorado Municipal Boundaries",Description="Colorado Municipal Boundaries")
AddGeoLayerViewGroupToGeoMap(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",Name="Colorado Municipalities",Description="Colorado Municipalities",InsertPosition="Top")
If(Name="IncludeBoundaries",Condition="${IncludeBoundaries} == true")
    AddGeoLayerViewToGeoMap(GeoLayerID="MunicipalBoundariesLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalBoundariesLayerView",Name="Colorado Municipal Boundaries",Description="Colorado Municipal Boundaries")
    # For now use single symbol
    # - grey
    SetGeoLayerViewSingleSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalBoundariesLayerView",Name="Colorado Municipal Boundaries",Description="Colorado Municipal Boundaries",Properties="color:#595959,opacity:1.0,fillColor:#595959,fillOpacity:0.3,weight:2")
EndIf(Name="IncludeBoundaries")
# = = = = = = = = = =
# Municipalities:  read layer and add to a layer view group.
# GeoLayerViewGroupID: MunicipalitiesGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/municipalities.geojson",GeoLayerID="MunicipalitiesLayer",Name="Colorado Municipalities",Description="Colorado Municipalities")
AddGeoLayerViewToGeoMap(GeoLayerID="MunicipalitiesLayer",GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalitiesLayerView",Name="Colorado Municipalities",Description="Colorado Municipalities",InsertPosition="Top")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on flow value
SetGeoLayerViewSingleSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalitiesLayerView",Name="Colorado Municipalities",Description="Colorado Municipalities",Properties="symbolImage:/img/group-2.png")
# SetGeoLayerViewCategorizedSymbol(GeoMapID="MunicipalitiesMap",GeoLayerViewGroupID="MunicipalitiesGroup",GeoLayerViewID="MunicipalitiesLayerView",Name="Colorado Municipalities",Description="Colorado Municipalities",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="MunicipalitiesProject",Indent="2",OutputFile="municipalities-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="municipalities-map.json",DestinationFile="${MapFolder}/municipalities-map.json")
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
CopyFile(SourceFile="layers/municipalities.geojson",DestinationFile="${MapFolder}/layers/municipalities.geojson")
## TODO smalers 2020-06-13 enable when it does not hang the app
If(Name="IncludeBoundaries2",Condition="${IncludeBoundaries} == true")
    CopyFile(SourceFile="layers/municipal-boundaries.geojson",DestinationFile="${MapFolder}/layers/municipal-boundaries.geojson")
EndIf(Name="IncludeBoundaries2")
#CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")
