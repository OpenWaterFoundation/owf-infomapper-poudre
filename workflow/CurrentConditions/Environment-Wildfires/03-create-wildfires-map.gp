# Create a GeoMapProject file for wildfire Perimeters for Colorado
# - read the previously downloaded layer file
# - filter out counties that intersect the Poudre Basin
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/CurrentConditions/Environment-Wildfires")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  WildfiresProject
# - GeoMapID:  CurrentWildfiresMap
CreateGeoMapProject(NewGeoMapProjectID="WildfiresProject",ProjectType="SingleMap",Name="Colorado Wildfires",Description="Colorado Wildfires",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="CurrentWildfiresMap",Name="Colorado Wildfires",Description="Colorado Wildfires",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10',docPath:wildfires-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="WildfiresProject",GeoMapID="CurrentWildfiresMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",Properties="docPath:layers/co-dwr-water-district-3.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WaterDistrictsGroup",GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
# = = = = = = = = = =
# Current fire imagery:  read layers and add a layer view group
# GeoLayerViewGroupID: WildfiresGroup
# - will show up in base layers
# - TODO smalers 2020-08-14 does not seem to work.  Want image of heat or smoke.
#ReadRasterGeoLayerFromTileMapService(InputUrl="https://fsapps.nwcg.gov/afm/cgi-bin/mapserv.exe?map=conus.map&",GeoLayerID="MODISFireDetectionsCurrentLayer",Name="MODIS Fire Detections (Current)",Description="1 km MODIS fire detections.",Properties="attribution: 'GTAC',isBackground: true")
#AddGeoLayerViewToGeoMap(GeoLayerID="MODISFireDetectionsCurrentLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MODISFireDetectionsCurrentLayerView",Name="MODIS Fire Detections (Current)",Description="1 km MODIS fire detections.",Properties="selectedInitial: false")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches.geojson")
ReadGeoLayerFromGeoJSON(InputFile="layers/stream-reaches.geojson",GeoLayerID="StreamReachesLayer",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="StreamReachesGroup",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
SetGeoLayerViewSingleSymbol(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="color:#6297f7,width:2")
#SetGeoLayerViewSingleSymbol(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
# SetGeoLayerViewCategorizedSymbol(GeoMapID="StreamReachesMap",GeoLayerViewGroupID="StreamReachesGroup",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
# = = = = = = = = = =
# Wildfire Perimeters:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WildfiresGroup
# TODO smalers 2020-08-14 Use a file for now but get the WFS working
SetProperty(PropertyName="UseFile",PropertyType="str",PropertyValue="true")
If(Name="UseFileIf",Condition="${UseFile} == true")
    # If reading from a file...
    ReadGeoLayerFromGeoJSON(InputFile="layers/wildfire-perimeters.geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire Perimeters from the National Interagency Fire Center")
EndIf(Name="UseFileIf")
If(Name="NotUseFileIf",Condition="${UseFile} != true")
    # If reading from the FWS...
    ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/5da472c6d27b4b67970acc7b5044c862_0.geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire Perimeters from the National Interagency Fire Center",Properties="sourceFormat:WFS")
EndIf(Name="NotUseFileIf")
AddGeoLayerViewGroupToGeoMap(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WildfiresGroup",Name="Colorado Wildfires",Description="Colorado wildfires",Properties="selectedInitial: true",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WildfirePerimetersLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WildfiresGroup",GeoLayerViewID="WildfirePerimetersLayerView",Name="Colorado Wildfires Perimeters",Description="Colorado wildfire perimeters from the National Interagency Fire Center",Properties="docPath:layers/wildfire-perimeters.md")
SetGeoLayerViewSingleSymbol(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WildfiresGroup",GeoLayerViewID="WildfirePerimetersLayerView",Name="WildfirePerimetersSymbol",Description="Wildfire Perimeters symbol",Properties="color:#ff0000,fillColor:#ff0000,fillOpacity:0.3")
# TODO smalers 2020-08-14 need to classify on area or some other attribute
#SetGeoLayerViewCategorizedSymbol(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WildfiresGroup",GeoLayerViewID="WildfirePerimetersLayerView",Name="Colorize wildfire Perimeters",Description="Show each wildfire perimeter the same color",ClassificationAttribute="county",Properties="classificationType:'categorized',classificationFile:'layers/wildfire-perimeters-classify-county.csv'")
#SetGeoLayerViewEventHandler(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="WildfiresGroup",GeoLayerViewID="WildfirePerimetersLayerView",EventType="click",Properties="popupConfigPath:graphs/county-popup-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="WildfiresProject",Indent="2",OutputFile="wildfires-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="wildfires-map.json",DestinationFile="${MapFolder}/wildfires-map.json")
CopyFile(SourceFile="wildfires-map.md",DestinationFile="${MapFolder}/wildfires-map.md")
# -----
# Layers
#
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.md")
#
CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")
#
CopyFile(SourceFile="layers/wildfire-perimeters.geojson",DestinationFile="${MapFolder}/layers/wildfire-perimeters.geojson")
#CopyFile(SourceFile="layers/wildfire-perimeters-classify-wildfire-perimeters.csv",DestinationFile="${MapFolder}/layers/wildfire-perimeters-classify-wildfire-perimeters.csv")
CopyFile(SourceFile="layers/wildfire-perimeters.md",DestinationFile="${MapFolder}/layers/wildfire-perimeters.md")
