# Map: Poudre Basins

* Background
* Layer Groups

-------------------

## Background

The Poudre Basins map shows hydrologic basins, also called catchments.
Although there are multiple basin delineations available,
[Hydrologic Unit Maps](https://water.usgs.gov/GIS/huc.html) defined
by the United States Geological Survey (USGS) are widely used.
HUC basins use a Hydrologic Unit Code (HUC) to uniquely identify basins at various scales.
Headwater basins receive water only from their area,
while downstream basins receive local precipitation and the inflows from upstream basins.
Streams and rivers merge at confluences.
Elevation break lines and confluences help define basin boundaries,
and stream gages may be located at basin outflow points.
Basin boundaries typically focus on surface features,
although subsurface features may help define basins in some areas.

The USGS has been updating nationwide datasets for water,
involving water bodies and basins.
The use of "HUC" is still relevant and popular, and the term "Watershed Boundary Dataset (WBD)" is also used.

The HUC is a numerical code with 2 to 16 digits that uniquely identifies basins at different scale.
Two-digits are reserved at each scale level to provide additional granularity.
Note that this identification code is similar to the
[USGS approach used to identify stream sites](https://help.waterdata.usgs.gov/faq/sites/do-station-numbers-have-any-particular-meaning),
but is not the same number.
The following table lists the HUC identifiers that are relevant to the Poudre Basin,

| **HUC level (# of digits)** | **HUC for Poudre Basin** | **Basin Name** | **Comment** |
| -- | -- | -- | -- |
| 2 | `10` | `Missouri` | |
| 4 | `1019` | `Platte` | |
| 6 | `101900` | `Platte` | Same as HUC4. |
| 8 | `10190007` | `Cache La Poudre` | Slightly different from Colorado Water District 3. |
| 10 | `10190007xx` | Example: `South Fork Cache la Poudre River` | HUC8 subdivided into smaller basins. |
| 12 | `10190007xxxx` | Example: `La Poudre Pass Creek` | HUC10 subdivided into smaller basins. |
| 14 | `10190007xxxxxx` | | No further subdivision - no data. |
| 16 | `10190007xxxxxxxx` | | No further subdivision - no data. |

## Layer Groups

The following layer groups are included in this map.

| **Layer Group** | **Description** |
| -- | -- |
| Hydrologic Unit Code Basins | Hydrologic Unit Code (HUC) basins. |
| CO DWR Water Districts | Division of Water Resources water districts, to highlight the Poudre Basin (Water District 3).  See the ***Basin Entities / Administration - Division 1 Water Districts*** map for more information. |
| Background Layers | Background layers that provide a frame of reference. |
