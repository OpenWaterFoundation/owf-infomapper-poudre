# Create a GeoMapProject file for instream flow reaches for the Poudre Basin
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Environment-InstreamFlowReaches")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  InstreamReachesProject
# - GeoMapID:  InstreamReachesMap
CreateGeoMapProject(NewGeoMapProjectID="InstreamReachesProject",ProjectType="SingleMap",Name="Instream Flow Reaches",Description="Instream Flow Reaches",Properties="author:'Open Water Foundation',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="InstreamReachesMap",Name="Instream Flow Reaches",Description="Instream Flow Reaches",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10',docPath:'instream-reaches-map.md'")
AddGeoMapToGeoMapProject(GeoMapProjectID="InstreamReachesProject",GeoMapID="InstreamReachesMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
#
# Mapbox background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: true,separatorBefore:true")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
#
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="layers/co-dwr-water-district-3.md")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/districts/co-dwr-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",InsertPosition="Top",Properties="docPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json")
# = = = = = = = = = =
# Natural Lakes:  read layer and add to a layer view group.
# GeoLayerViewGroupID: NaturalLakesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="NaturalLakesGroup",Name="Natural Lakes",Description="Natural lakes",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/cwcb/instream-flow/co-natural-lakes.geojson",GeoLayerID="NaturalLakesLayer",Name="Natural Lakes",Description="Natural lakes from CWCB")
AddGeoLayerViewToGeoMap(GeoLayerID="NaturalLakesLayer",GeoLayerViewID="NaturalLakesLayerView",Name="Natural Lakes",Description="Natural lakes from CWCB",Properties="docPath:'layers/natural-lakes.md'")
# Use single symbol.
SetGeoLayerViewSingleSymbol(GeoLayerViewID="NaturalLakesLayerView",Name="Natural Lakes",Description="Natural lakes from CWCB",Properties="symbolShape:Circle,color:black,fillColor:black,symbolSize:4,sizeUnits:pixels,opacity:1.0,fillOpacity:1.0,weight:1.5")
SetGeoLayerViewEventHandler(GeoLayerViewID="NaturalLakesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/natural-lakes-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="NaturalLakesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/natural-lakes-event-config.json")
# = = = = = = = = = =
# Instream flow reaches:  read layer and add to a layer view group.
# GeoLayerViewGroupID: InstreamReachesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="InstreamReachesGroup",Name="Instream Flow Reaches",Description="Instream Flow Reaches",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/cwcb/instream-flow/co-isf-reaches-division1.geojson",GeoLayerID="InstreamReachesLayer",Name="Instream Flow Reaches",Description="Instream Flow Reaches")
AddGeoLayerViewToGeoMap(GeoLayerID="InstreamReachesLayer",GeoLayerViewID="InstreamReachesLayerView",Name="Instream Flow Reaches",Description="Instream Flow Reaches",Properties="docPath:'layers/instream-reaches.md',highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="InstreamReachesLayerView",Name="Instream Flow Reaches",Description="Instream Flow Reaches",Properties="color:#6297f7")
SetGeoLayerViewEventHandler(GeoLayerViewID="InstreamReachesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/instream-reaches-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="InstreamReachesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/instream-reaches-event-config.json")
# = = = = = = = = = =
# Instream flow termini:  read layer and add to a layer view group.
# GeoLayerViewGroupID: InstreamReachesGroup
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/cwcb/instream-flow/co-isf-reach-termini-division1.geojson",GeoLayerID="InstreamTerminiLayer",Name="Instream Flow Reach Termini",Description="Instream Flow Reach Termini")
AddGeoLayerViewToGeoMap(GeoLayerID="InstreamTerminiLayer",GeoLayerViewID="InstreamTerminiLayerView",Name="Instream Flow Reach Termini",Description="Instream Flow Reach Termini",Properties="docPath:'layers/instream-termini.md',highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="InstreamTerminiLayerView",Name="Instream Flow Reach Termini",Description="Instream Flow Reach Termini shown as cyan diamond",Properties="symbolShape:Diamond,color:cyan,fillColor:cyan,size:6,sizeUnits:pixels,opacity:1.0,fillOpacity:1.0,weight:1.5")
SetGeoLayerViewEventHandler(GeoLayerViewID="InstreamTerminiLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/instream-termini-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="InstreamTerminiLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/instream-termini-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="InstreamReachesProject",Indent="2",OutputFile="instream-reaches-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="instream-reaches-map.json",DestinationFile="${MapFolder}/instream-reaches-map.json")
CopyFile(SourceFile="instream-reaches-map.md",DestinationFile="${MapFolder}/instream-reaches-map.md")
#
#CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-event-config.json")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.md")
#
CopyFile(SourceFile="layers/instream-reaches.md",DestinationFile="${MapFolder}/layers/instream-reaches.md")
CopyFile(SourceFile="layers/instream-reaches-event-config.json",DestinationFile="${MapFolder}/layers/instream-reaches-event-config.json")
#
CopyFile(SourceFile="layers/instream-termini.md",DestinationFile="${MapFolder}/layers/instream-termini.md")
CopyFile(SourceFile="layers/instream-termini-event-config.json",DestinationFile="${MapFolder}/layers/instream-termini-event-config.json")
#
CopyFile(SourceFile="layers/natural-lakes.md",DestinationFile="${MapFolder}/layers/natural-lakes.md")
CopyFile(SourceFile="layers/natural-lakes-event-config.json",DestinationFile="${MapFolder}/layers/natural-lakes-event-config.json")
