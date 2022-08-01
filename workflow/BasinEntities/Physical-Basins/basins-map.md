# Map: Poudre Basins

* Overview
* Comparison with Administrative and Other Basins
    + Joe Wright Creek Omitted from Water District 3
    + Wyoming Streams Omitted from Water District 3
* Layer Groups

-------------------

## Overview

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
The following table lists the HUC identifiers that are relevant to the Poudre Basin.

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

## Comparison with Administrative and Other Basins

Hydrologic basins are typically determined from elevation data that defines the flow path for water.
Ridge lines define breaks between flow directions. Streams meet at confluence points that
define where small basins can be combined to create larger basins.

In contrast, administrative (see ***Basin Entities / Administrative - CO DWR Water Districts***)
and other basins, may have boundaries that correspond to political, operational, or other jurisdictions.
These boundaries may generally follow hydrologic basin boundaries in part,
and may also correspond to straight-line boundaries for counties, states, and other entities.
This unfortunately leads to complexities in data presentation and use.

To avoid confusion, it is important to pick basin boundaries that are relevant to the purpose
and scale of an analysis and visualization, and clearly indicate what the meaning of "basin"
is within the context of a discussion.
For example, the general term "Poudre River Basin", "upper basin", "lower basin", etc. may be clear from the context,
or may need to be clarified by using more specific basin terminology such as
"DWR Water District 3", or "HUC 8 basin".

### Joe Wright Creek Omitted from Water District 3

DWR Water District 3 does not contain Joe Wright Creek, whereas HUC 8 Basin does contain Joe Wright Creek.
The District 3 Water Commissioner indicated that "Joe Wright was tributary to the Laramie River before the
landslide created [Chambers Lake](https://en.wikipedia.org/wiki/Chambers_Lake_(Colorado))
and pushed Joe Wright Creek south to the Poudre."

### Wyoming Streams Omitted from Water District 3

DWR's Source Water Route Framework dataset,
which is the basis of the stream reach data, did not originally include streams outside of District 3.
Over time, streams in Wyoming are being added.
The Open Water Foundation has requested that the remaining Wyoming streams in the
Poudre HUC basin should be included in the State's dataset.

## Layer Groups

The following layer groups are included in this map.

| **Layer Group** | **Description** |
| -- | -- |
| Stream Reaches | Stream reaches within the basin. |
| Hydrologic Unit Code Basins | Hydrologic Unit Code (HUC) basins. |
| CO DWR Water Districts | Division of Water Resources water districts, to highlight the Poudre Basin (Water District 3).  See the [***Basin Entities / Administration - CO DWR Water Districts***](#map/entities-codwr-waterdistricts) map for more information. |
| Continental Divide | Continental divide line, to help understand transbasin issues. |
| Background Layers | Background layers that provide a frame of reference. |
