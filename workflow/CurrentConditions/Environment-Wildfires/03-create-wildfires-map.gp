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
# - add tile servers from MapBox, Esri, and Google
#
# Mapbox background layers
AddGeoLayerViewGroupToGeoMap(GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoMapID="CurrentWildfiresMap",GeoLayerViewGroupID="BackgroundGroup",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: true")
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
# - set to LocalFile for prepreocessed GeoJSON file
# - set to GeoJSONService for GeoJSON returned from service
# - set to WFSGeoJSON to use WFS and return a GeoJSON
# SetProperty(PropertyName="PerimeterSource",PropertyType="str",PropertyValue="LocalFile")
#SetProperty(PropertyName="PerimeterSource",PropertyType="str",PropertyValue="WFSGeoJSON")
SetProperty(PropertyName="PerimeterSource",PropertyType="str",PropertyValue="GeoJSONFromWFS")
If(Name="UseFileIf",Condition="${PerimeterSource} == LocalFile")
    # Reading from a local file...
    ReadGeoLayerFromGeoJSON(InputFile="layers/wildfire-perimeters.geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire Perimeters from the National Interagency Fire Center")
EndIf(Name="UseFileIf")
If(Name="UseGeoJSONServiceIf",Condition="${PerimeterSource} == GeoJSONService")
    # If reading from the FWS...
    ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/5da472c6d27b4b67970acc7b5044c862_0.geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire Perimeters from the National Interagency Fire Center",Properties="sourceFormat:WFS")
EndIf(Name="UseGeoJSONServiceIf")
If(Name="UseWFSGeoJSONIf",Condition="${PerimeterSource} == WFSGeoJSON")
    # If reading from the WFS...
    # Does not work...
    # ReadGeoLayerFromWebFeatureService(InputUrl="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?outFields=*&where=1%3D1",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimiters",Description="Colorado wildfire perimeters web service")
    # Works but URL is too long
    # - TODO smalers 2020-08-19
    # - Can return GeoJSON, but in this case just use ReadGeoLayerFromGeoJSON
    # ReadGeoLayerFromWebFeatureService(InputUrl="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pgeojson&token=",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimiters",Description="Colorado wildfire perimeters web service")
EndIf(Name="UseWFSGeoJSONIf")
If(Name="UseGeoJSONFromWFSIf",Condition="${PerimeterSource} == GeoJSONFromWFS")
    # If reading from the WFS...
    # Does not work...
    # ReadGeoLayerFromWebFeatureService(InputUrl="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?outFields=*&where=1%3D1",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimiters",Description="Colorado wildfire perimeters web service")
    # Works but URL is too long
    # - TODO smalers 2020-08-19
    # - Can return GeoJSON, but in this case just use ReadGeoLayerFromGeoJSON
    # The following uses a minimual number of parameters, shown without URL encoding:
    # - where=1=1 (why needed?)
    # - geometryType=esriGeometryEnvelope (used to specify rectangle for query)
    # - geometry=xmin,xmax,ymin,ymax  (where x is longitude and y is latitude, must URL-encode commas using %2C)
    # - inSR=4326 (input CRS, for the bounding box, default is that of the layer on the server)
    # - returnGeometry=true (default, to return geometries)
    # - f=pgeojson (pretty GeoJSON)
    # - f=geojson (GeoJSON)
    # - outfields=* (return all attributes)
    # - geometryPrecision=5 (digits for coordinates)
    # - outSR (seems to default to 4326 for GeoJSON output format)
    # - multipatchOption (is this needed?)
    # - spatialRel=esriSpatialRelContains (how the envelope is used to select features)
    ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimiters",Description="Colorado wildfire perimeters web service")
    #
    # The following uses too many parameters based on the Esri URL-builder, which are difficult for a user to deal with.
    #ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pgeojson&token=",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimiters",Description="Colorado wildfire perimeters web service")
EndIf(Name="UseGeoJSONFromWFSIf")
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
