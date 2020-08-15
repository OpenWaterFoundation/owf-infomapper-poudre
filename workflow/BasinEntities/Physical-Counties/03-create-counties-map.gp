# Create a GeoMapProject file for counties for the Poudre Basin
# - read the previously downloaded layer file
# - filter out counties that intersect the Poudre Basin
# - output to the dist/info-mapper folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Physical-Counties")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  CountiesProject
# - GeoMapID:  CountiesMap
CreateGeoMapProject(NewGeoMapProjectID="CountiesProject",ProjectType="SingleMap",Name="CO Counties",Description="Colorado Counties",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="CountiesMap",Name="Colorado Counties",Description="Colorado Counties",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.385,40,8',docPath:counties-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="CountiesProject",GeoMapID="CountiesMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CountiesMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Water division:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division.geojson",DestinationFile="layers/co-dwr-water-division.geojson")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division-classify-division.csv",DestinationFile="layers/co-dwr-water-division-classify-division.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-division.geojson",GeoLayerID="WaterDivisionLayer",Name="CO DWR Division 1",Description="Water Division 1 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CountiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDivisionLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDivisionLayerView",Name="CO DWR Division 1",Description="Boundary for Division 1 from the Colorado Division of Water Resources",Properties="docPath:layers/co-dwr-water-division.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="CountiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDivisionLayerView",Name="Colorize divisions",Description="Symbol for the division",ClassificationAttribute="DIV",Properties="classificationFile:'layers/co-dwr-water-division-classify-division.csv'")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",Properties="docPath:layers/co-dwr-water-district-3.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="CountiesMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
# = = = = = = = = = =
# Counties:  read layer and add to a layer view group.
# GeoLayerViewGroupID: CountiesGroup
ReadGeoLayerFromGeoJSON(InputFile="layers/counties.geojson",GeoLayerID="CountiesLayer",Name="Colorado Counties",Description="Colorado Counties")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CountiesMap",GeoLayerViewGroupID="CountiesGroup",Name="Colorado Counties",Description="Colorado Counties",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="CountiesLayer",GeoMapID="CountiesMap",GeoLayerViewGroupID="CountiesGroup",GeoLayerViewID="CountiesLayerView",Name="Colorado Counties",Description="Colorado Counties",Properties="docPath:layers/counties.md")
SetGeoLayerViewCategorizedSymbol(GeoMapID="CountiesMap",GeoLayerViewGroupID="CountiesGroup",GeoLayerViewID="CountiesLayerView",Name="Colorize counties",Description="Show each county the same color except those that overlap the Poudre",ClassificationAttribute="county",Properties="classificationType:'categorized',classificationFile:'layers/counties-classify-county.csv'")
SetGeoLayerViewEventHandler(GeoMapID="CountiesMap",GeoLayerViewGroupID="CountiesGroup",GeoLayerViewID="CountiesLayerView",EventType="click",Properties="popupConfigPath:graphs/county-popup-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="CountiesProject",Indent="2",OutputFile="counties-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="counties-map.json",DestinationFile="${MapFolder}/counties-map.json")
CopyFile(SourceFile="counties-map.md",DestinationFile="${MapFolder}/counties-map.md")
# -----
# Layers
CopyFile(SourceFile="layers/co-dwr-water-division.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-division.geojson")
CopyFile(SourceFile="layers/co-dwr-water-division-classify-division.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-division-classify-division.csv")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division.md",DestinationFile="${MapFolder}/layers/co-dwr-water-division.md")
#
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.md")
#
CopyFile(SourceFile="layers/counties.geojson",DestinationFile="${MapFolder}/layers/counties.geojson")
CopyFile(SourceFile="layers/counties-classify-county.csv",DestinationFile="${MapFolder}/layers/counties-classify-county.csv")
CopyFile(SourceFile="layers/counties.md",DestinationFile="${MapFolder}/layers/counties.md")
# -------
# Graphs
CreateFolder(Folder="${MapFolder}/graphs",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="graphs/county-popup-config.json",DestinationFile="${MapFolder}/graphs/county-popup-config.json")
CopyFile(SourceFile="graphs/county-population-graph-config.json",DestinationFile="${MapFolder}/graphs/county-population-graph-config.json")
