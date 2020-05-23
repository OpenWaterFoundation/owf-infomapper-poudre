# Create a GeoMapProject file for current streamflow for the Poudre Basin
# - read the previously downloaded layer file
# - output to the dist/info-mapper folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AssetsFolder",PropertyType="str",PropertyValue="../../../dist/info-mapper")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AssetsFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/CurrentConditions/WaterSupply-Streamflow")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  StreamflowProject
# - GeoMapID:  StreamflowMap
CreateGeoMapProject(NewGeoMapProjectID="StreamflowProject",ProjectType="SingleMap",Name="Poudre Streamflow",Description="Poudre Streamflow",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="StreamflowMap",Name="Poudre Streamflow",Description="Poudre Streamflow",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10'")
AddGeoMapToGeoMapProject(GeoMapProjectID="StreamflowProject",GeoMapID="StreamflowMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="StreamflowMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches.geojson")
ReadGeoLayerFromGeoJSON(InputFile="layers/stream-reaches.geojson",GeoLayerID="StreamReachesLayer",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
AddGeoLayerViewGroupToGeoMap(GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamReachesGroup",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
SetGeoLayerViewSingleSymbol(GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="weight:2")
# SetGeoLayerViewCategorizedSymbol(GeoMapID="StreamReachesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Diversions:  read layer and add to a layer view group.
# GeoLayerViewGroupID: DiversionGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/diversions.geojson",GeoLayerID="DiversionLayer",Name="Poudre Diversions",Description="Poudre Diversions")
AddGeoLayerViewGroupToGeoMap(GeoMapID="StreamflowMap",GeoLayerViewGroupID="DiversionGroup",Name="Poudre Diversions",Description="Poudre Diversions",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="DiversionLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="DiversionGroup",GeoLayerViewID="DiversionLayerView",Name="Poudre Diversions",Description="Poudre Diversions")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on flow value
SetGeoLayerViewSingleSymbol(GeoMapID="StreamflowMap",GeoLayerViewGroupID="DiversionGroup",GeoLayerViewID="DiversionLayerView",Name="Poudre Diversions",Description="Poudre Diversions",Properties="builtinSymbolImage:/img/default-marker.png")
# SetGeoLayerViewCategorizedSymbol(GeoMapID="StreamflowMap",GeoLayerViewGroupID="DiversionGroup",GeoLayerViewID="DiversionLayerView",Name="Poudre Streamflow",Description="Show diversion structures",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Streamflow stations:  read layer and add to a layer view group.
# GeoLayerViewGroupID: StreamflowGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/streamgages.geojson",GeoLayerID="StreamflowLayer",Name="Poudre Streamflow",Description="Poudre Streamflow")
AddGeoLayerViewGroupToGeoMap(GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamflowGroup",Name="Poudre Streamflow",Description="Poudre Streamflow",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamflowLayer",GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamflowGroup",GeoLayerViewID="StreamflowLayerView",Name="Poudre Streamflow",Description="Poudre Streamflow")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on flow value
SetGeoLayerViewSingleSymbol(GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamflowGroup",GeoLayerViewID="StreamflowLayerView",Name="Poudre Streamflow",Description="Poudre Streamflow",Properties="builtinSymbolImage:/img/default-marker.png")
# SetGeoLayerViewCategorizedSymbol(GeoMapID="StreamflowMap",GeoLayerViewGroupID="StreamflowGroup",GeoLayerViewID="StreamflowLayerView",Name="Poudre Streamflow",Description="Show streamflow stations",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="StreamflowProject",Indent="2",OutputFile="streamflow.json")
CopyFile(SourceFile="streamflow.json",DestinationFile="${MapFolder}/streamflow.json")
CopyFile(SourceFile="layers/streamgages.geojson",DestinationFile="${MapFolder}/layers/streamgages.geojson")
CopyFile(SourceFile="layers/diversions.geojson",DestinationFile="${MapFolder}/layers/diversions.geojson")
CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")