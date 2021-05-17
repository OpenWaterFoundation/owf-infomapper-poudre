# Create merged water providers layer from DOLA districts and entity water provider data.
# - layers/*.geojson files were previously created
# - read the layers and manipulate attributes to only have Name, Type, and Website properties
#
# Read DOLA water providers.
ReadGeoLayerFromGeoJSON(InputFile="layers/water-provider-boundaries-dola.geojson",GeoLayerID="WaterDistrictsDolaLayer",Name="Water District Boundaries (DOLA)",Description="Water district boundaries, from DOLA")
#
# Read Denver Water.
# - manually modify GeoJSON to include: "Name": "Denver Water", "Website": "https://www.denverwater.org/"
ReadGeoLayerFromGeoJSON(InputFile="layers/denver-water-boundary.geojson",GeoLayerID="DenverWaterBoundaryLayer",Name="Denver Water Service Area",Description="Denver Water service area, from Denver Water")
#
# Read Fort Collins.
ReadGeoLayerFromGeoJSON(InputFile="layers/fort-collins-boundary.geojson",GeoLayerID="FortCollinsBoundaryLayer",Name="Fort Collins Utilities Service Area",Description="Fort Collins Utilities (Water) service area, from Fort Collins")
#
# Merge the layers
MergeGeoLayers(GeoLayerIDs="WaterDistrictsDolaLayer,DenverWaterBoundaryLayer,FortCollinsBoundaryLayer",OutputGeoLayerID="WaterProvidersBoundaryLayer",Name="Water Provider Boundaries",Description="Water providers boundary layer (merged)",AttributeMap="LGNAME:Name,URL:Website")
#
# Write the merged file using the general layer file name.
WriteGeoLayerToGeoJSON(GeoLayerID="WaterProvidersBoundaryLayer",OutputFile="layers/water-provider-boundaries.geojson")