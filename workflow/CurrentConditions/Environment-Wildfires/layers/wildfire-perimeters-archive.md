# Layer: Historical Wildfire Perimeters

The Historical Wildfire Perimeters layer contains Historical wildfires for Colorado.
The national layer is clipped to Colorado for fires >= 150 acres and year >= 2000
to limit the size of the layer.

## Data Sources

The following are data sources for this map:

| **Resource** | **Source** |
| -- | -- |
| Historical Wildfire Perimeters layer. | [Interagency Fire Perimeter History - All Years](https://data-nifc.opendata.arcgis.com/datasets/interagency-fire-perimeter-history-all-years) dataset from the National Interagency Fire Center.  The Feature Web Service (FWS) is queried. The Wildland Fire Interagency Geospatial Services (WFIGS) Group is in the process of creating the [WFIGS - Wildland Fire Perimeters Full History](https://data-nifc.opendata.arcgis.com/datasets/nifc::wfigs-wildland-fire-perimeters-full-history/about).  However, as of 2021-07-12 this dataset only contains 2021 wildfires.  The new layer will be used in the future when full history is available. |

## Workflow

The workflow to create the map can be found in the [GitHub repository](https://github.com/OpenWaterFoundation/owf-infomapper-poudre/tree/master/workflow/CurrentConditions/Environment-Wildfires).
