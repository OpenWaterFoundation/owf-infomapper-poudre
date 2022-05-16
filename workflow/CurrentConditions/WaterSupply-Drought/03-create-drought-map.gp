# Create a GeoMapProject file for current conditions drought
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/CurrentConditions/WaterSupply-Drought")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  DroughtProject
# - GeoMapID:  CurrentDroughtMap
CreateGeoMapProject(NewGeoMapProjectID="DroughtProject",ProjectType="SingleMap",Name="Current Drought",Description="Current drought",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="CurrentDroughtMap",Name="Current Drought",Description="Current drought",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.5,40.7,10',docPath:drought-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="DroughtProject",GeoMapID="CurrentDroughtMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground:true,selectedInitial:true")
#
# Mapbox background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial:false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial:false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial:false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial:false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial:false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial:true,separatorBefore:true")
# = = = = = = = = = =
# Colorado state boundary:  read layer and add to layer view group.
# StateBoundaryGroupID: StateBoundaryGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StateBoundaryGroup",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/4402a8e032ed49eb8b37fd729e4e8f03_9.geojson",GeoLayerID="StateBoundaryLayer",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.")
AddGeoLayerViewToGeoMap(GeoLayerID="StateBoundaryLayer",GeoLayerViewID="StateBoundaryLayerView",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE",InsertPosition="Top",Properties="docPath:layers/co-state-boundary.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StateBoundaryLayerView",Name="State boundary symbol",Description="State boundary in black.",Properties="color:#000000,fillColor:#000000,fillOpacity:0.0,weight:2")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial:true",InsertPosition="Top")
#
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.geojson",DestinationFile="layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json",DestinationFile="layers/co-dwr-water-district-3-event-config.json")
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="layers/co-dwr-water-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",Properties="docPath:layers/co-dwr-water-district-3.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:layers/co-dwr-water-district-3-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/co-dwr-water-district-3-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/co-dwr-water-district-3-event-config.json")
# = = = = = = = = = =
# Continental divide in Colorado:  read layer and add to layer view group.
# LayerViewGroupID: ContinentalDivideGroup
CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json",DestinationFile="layers/continental-divide-co-event-config.json")
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="ContinentalDivideGroup",Name="Continental Divide",Description="Continental Divide based on Hydrologic Unit Code basins.",Properties="selectedInitial:true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://raw.githubusercontent.com/OpenWaterFoundation/owf-data-us-continental-divide/master/data/continental-divide-co.geojson",GeoLayerID="ContinentalDivideLayer",Name="Continental Divide",Description="Continental divide based on Hydrologic Unit Code basins")
AddGeoLayerViewToGeoMap(GeoLayerID="ContinentalDivideLayer",GeoLayerViewID="ContinentalDivideLayerView",Name="Continental Divide",Description="Continental divide based on Hydrologic Unit Code basins",InsertPosition="Top",Properties="docPath:layers/continental-divide.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="ContinentalDivideLayerView",Name="Continental divide symbol",Description="Continental divide line in wide dark grey.",Properties="color:#663300,opacity:0.5,fillColor:#663300,fillOpacity:0.5,weight:10")
SetGeoLayerViewEventHandler(GeoLayerViewID="ContinentalDivideLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/continental-divide-co-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="ContinentalDivideLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/continental-divide-co-event-config.json")
# = = = = = = = = = =
# Drought:  read layer and add to a layer view group.
# GeoLayerViewGroupID: DroughtGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="DroughtGroup",Name="US Drought Monitor",Description="US Drought Monitor",InsertPosition="Top")
#
# Use the current GeoJSON file from the OWF cloud
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/US/USDM/USDM_current_M.geojson",GeoLayerID="DroughtLayer",Name="US Drought Monitor",Description="US Drought Monitor")
AddGeoLayerViewToGeoMap(GeoLayerID="DroughtLayer",GeoLayerViewID="DroughtLayerView",Name="US Drought Monitor",Description="US Drought Monitor",Properties="docPath:layers/drought-monitor.md")
# Use graduated symbol the same as the US Drought Monitor website
SetGeoLayerViewEventHandler(GeoLayerViewID="DroughtLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/drought-monitor-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DroughtLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/drought-monitor-event-config.json")
# The following is for the downloaded GeoJSON
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="DroughtLayerView",Name="Colorize drought monitor",Description="Show US Drought Monitor using standard colors.",ClassificationAttribute="DM",Properties="classificationFile:layers/drought-monitor-classify-dm.csv")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StreamReachesGroup",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="selectedInitial:true",InsertPosition="Top")
#
CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches.geojson")
CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.geojson",DestinationFile="layers/stream-reaches-event-config.json")
ReadGeoLayerFromGeoJSON(InputFile="layers/stream-reaches.geojson",GeoLayerID="StreamReachesLayer",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="docPath:layers/stream-reaches.md,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches",Properties="color:#6297f7,width:2")
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Poudre Stream Reaches")
#SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Poudre Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/stream-reaches-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/stream-reaches-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="DroughtProject",Indent="2",OutputFile="drought-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="drought-map.json",DestinationFile="${MapFolder}/drought-map.json")
CopyFile(SourceFile="drought-map.md",DestinationFile="${MapFolder}/drought-map.md")
# -----
# Layer
# Stream reaches.
CopyFile(SourceFile="layers/stream-reaches.geojson",DestinationFile="${MapFolder}/layers/stream-reaches.geojson")
CopyFile(SourceFile="layers/stream-reaches-event-config.json",DestinationFile="${MapFolder}/layers/stream-reaches-event-config.json")
CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="${MapFolder}/layers/stream-reaches.md")
# US Drought Monitor.
# - no need to copy layer because read from URL
CopyFile(SourceFile="layers/drought-monitor.md",DestinationFile="${MapFolder}/layers/drought-monitor.md")
CopyFile(SourceFile="layers/drought-monitor-event-config.json",DestinationFile="${MapFolder}/layers/drought-monitor-event-config.json")
CopyFile(SourceFile="layers/drought-monitor-classify-dm.csv",DestinationFile="${MapFolder}/layers/drought-monitor-classify-dm.csv")
# Continental divide.
# - no need to copy layer because read from URL
CopyFile(SourceFile="layers/continental-divide-co-event-config.json",DestinationFile="${MapFolder}/layers/continental-divide-co-event-config.json")
CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md",DestinationFile="${MapFolder}/layers/continental-divide.md")
# Water district 3.
CopyFile(SourceFile="layers/co-dwr-water-district-3.geojson",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.geojson")
CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
CopyFile(SourceFile="layers/co-dwr-water-district-3-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-event-config.json")
CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.md")
