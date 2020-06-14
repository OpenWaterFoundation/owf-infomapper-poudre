# Create a GeoMapProject file for District 3 irrigated lands
# - read the previously downloaded layer file
# - output to the dist/info-mapper folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/HistoricalData/Agriculture-IrrigatedLands")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  IrrigatedLandsProject
# - GeoMapID:  IrrigatedLandsMap
CreateGeoMapProject(NewGeoMapProjectID="IrrigatedLandsProject",ProjectType="SingleMap",Name="District 3 Irrigated Lands",Description="District 3 irrigated lands.",Properties="author:'Open Water Foundation',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="IrrigatedLandsMap",Name="District 3 Irrigated Lands",Description="District 3 irrigated lands from CDSS.",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10'")
AddGeoMapToGeoMapProject(GeoMapProjectID="IrrigatedLandsProject",GeoMapID="IrrigatedLandsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Irrigated lands
# - select the most recent for initial view
# = = = = = = = = = =
# Irrigated lands (1956):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-1956.geojson",GeoLayerID="IrrigatedLands1956Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (1956) for District 3 from Colorado's Decision Support Systems.")
# The following layer view group is used for all years
AddGeoLayerViewGroupToGeoMap(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",Name="District 3 Irrigated Lands",Description="Irrigated lands for District 3 from from Colorado's Decision Support System.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands1956Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1956LayerView",Name="District 3 Irrigated Lands (1956)",Description="Irrigated lands (1956) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1956LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (1976):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-1976.geojson",GeoLayerID="IrrigatedLands1976Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (1976) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands1976Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1976LayerView",Name="District 3 Irrigated Lands (1976)",Description="Irrigated lands (1976) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1976LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (1987):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-1987.geojson",GeoLayerID="IrrigatedLands1987Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (1987) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands1987Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1987LayerView",Name="District 3 Irrigated Lands (1987)",Description="Irrigated lands (1987) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1987LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (1997):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-1997.geojson",GeoLayerID="IrrigatedLands1997Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (1997) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands1997Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1997LayerView",Name="District 3 Irrigated Lands (1997)",Description="Irrigated lands (1997) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands1997LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (2001):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-2001.geojson",GeoLayerID="IrrigatedLands2001Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (2001) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands2001Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2001LayerView",Name="District 3 Irrigated Lands (2001)",Description="Irrigated lands (2001) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2001LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (2005):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-2005.geojson",GeoLayerID="IrrigatedLands2005Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (2005) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands2005Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2005LayerView",Name="District 3 Irrigated Lands (2005)",Description="Irrigated lands (2005) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2005LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (2010):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-2010.geojson",GeoLayerID="IrrigatedLands2010Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (2010) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands2010Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2010LayerView",Name="District 3 Irrigated Lands (2010)",Description="Irrigated lands (2010) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2010LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Irrigated lands (2015):  read layer and add to a layer view group.
# GeoLayerViewGroupID: IrrigatedLandsGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/irrigated-lands-2015.geojson",GeoLayerID="IrrigatedLands2015Layer",Name="District 3 Irrigated Lands",Description="Irrigated lands (2015) for District 3 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="IrrigatedLands2015Layer",GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2015LayerView",Name="District 3 Irrigated Lands (2015)",Description="Irrigated lands (2015) from CDSS",InsertPosition="Top",Properties="selectedInitial:true")
SetGeoLayerViewCategorizedSymbol(GeoMapID="IrrigatedLandsMap",GeoLayerViewGroupID="IrrigatedLandsGroup",GeoLayerViewID="IrrigatedLands2015LayerView",Name="Colorize irrigated lands by crop type",Description="Show each irrigated parcel colored by crop type.",ClassificationAttribute="CROP_TYPE",Properties="classificationType:'categorized',classificationFile:'layers/irrigated-lands-classify-croptype.csv'")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="IrrigatedLandsProject",Indent="2",OutputFile="irrigated-lands-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="irrigated-lands-map.json",DestinationFile="${MapFolder}/irrigated-lands-map.json")
CopyFile(SourceFile="layers/irrigated-lands-1956.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-1956.geojson")
CopyFile(SourceFile="layers/irrigated-lands-1976.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-1976.geojson")
CopyFile(SourceFile="layers/irrigated-lands-1987.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-1987.geojson")
CopyFile(SourceFile="layers/irrigated-lands-1997.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-1997.geojson")
CopyFile(SourceFile="layers/irrigated-lands-2001.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-2001.geojson")
CopyFile(SourceFile="layers/irrigated-lands-2005.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-2005.geojson")
CopyFile(SourceFile="layers/irrigated-lands-2010.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-2010.geojson")
CopyFile(SourceFile="layers/irrigated-lands-2015.geojson",DestinationFile="${MapFolder}/layers/irrigated-lands-2015.geojson")
CopyFile(SourceFile="layers/irrigated-lands-classify-croptype.csv",DestinationFile="${MapFolder}/layers/irrigated-lands-classify-croptype.csv")
