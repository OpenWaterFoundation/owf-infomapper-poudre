# Poudre Basin Information / Release Notes

The following release notes summarize changes to the Poudre Basin Information website:

* The release date shown is typically the date that the version is made public.
  Follow up changes for the same version may occur.
* A versioned release that is undergoing review before publishing can be accessed using the release
  version in the website URL rather than `latest`.
* Release notes for multiple versions may be grouped, with minor release number shown in the comment.
* Version numbers follow the [semantic versioning](https://semver.org) standard.

| **Release** | **Date**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| -- | -- | -- |
| 2.4.0 | 2022-07-05 | Begin phasing in datasets from the OWF `data` website to streamline use of shared datasets.  Initial dashboards released.  Many updates. |
| 2.3.0 | | Add East Troublesome soil burn severity, various other data additions. |
| 2.2.0 | | Functional data table search tool for points and polygons. |
| 2.1.0 | | Add SNODAS snowpack to wildfires map and for water supply map, add US Drought Monitor map. |
| 2.0.0 | | Update for InfoMapper 2.0.0. Add water provider boundaries and geocode address search. |
| 1.1.0 | | Update for InfoMapper 1.4.0. |
| 1.0.0 | | First official release due to InfoMapper feature maturity. |
| 0.7.0 | | Update all layers to limit the attributes shown in popup dialogs. |
| 0.6.0 | | Add data tables for map layers and search feature for layers. |
| 0.5.0 | | Update to Angular 10. |
| 0.4.0 | | Add popup layer menu with option to view layer data table. |
| 0.3.0 | | Add popup documentation for all maps and layers.  Add wildfires and others maps. |
| 0.2.x | | Update to use general InfoMapper software as a platform for the application. |
| 0.1.0 | | Initial version as custom application. | 

------------

## 2.4.0 ##

**Feature release reflecting many software and dataset updates.**

* [2.4.0] Update the website from `http` to `https` protocol to adhere to web security requirements.
  Some `http` links broke and have been updated in this release.
* [2.4.0] Add initial prototype dashboards with indicators:
    + See the ***Dashboards*** menu, for example the [***Main Dashboard***](#dashboard/poudre-main-dashboard).
    + Dashboards and indicators will be enabled as supporting data are identified and automated workflows are implemented.
* [2.4.0] Add the initial [***Current Conditions / Environment - Floods***](#/map/current-floods) map.
* [2.4.0] Begin phasing in datasets on [data.openwaterfoundation.org](https://data.openwaterfoundation.org):
    + Datasets are managed independent of software use and provide landing pages.
    + InfoMapper workflows are streamlined because they focus on map configurations.
* [2.4.0] Update the [***Current Conditions / Environment - Wildfires***](#/map/current-wildfires) map:
    + Fix the historical wildfire perimeters layer due to a change in the dataset URL.
    + Add the HUC 12 basins layer to the map.

## 2.3.0 ##

* [2.3.0] Update CO DWR water division offices layers to include all division offices.
* [2.3.0] Add East Troublesome soil burn severity map layer.
  Update soil burn severity to use data from USGS download site.
* [2.3.0] Add Thornton Pipeline and Chimney Hollow to projects map.
* [2.3.0] Add CSU Water Archives, Fort Collins Water Works, and The Water Desk to educational organizations map.
* [2.3.0] Configure so that polygon features highlight for mouse over for some layers.
  This makes it easier to visually understand polygon boundaries.

## 2.2.0 ##

* [2.2.0] Used with Go Code Colorado Business Solutions Challenge final.
* [2.2.0] Functional data table search tool for feature data and address for polygons,
  with zoom to and clear selection functionality.
* [2.2.0] InfoMapper improvements to streamline selected features.

## 2.1.0

* [2.1.0] Enable links from information pages to website pages to improve navigation.
* [2.1.0] Add US Drought Monitor to [***Current Conditions / Water Supply - Drought***](#map/current-drought).
* [2.1.0] Add SNODAS snowpack and SNOTEL stations layers to [***Current Conditions / Environment - Wildfires***](#map/current-wildfires).
* [2.1.0] Enable [***Current Conditions / Water Supply - Snowpack***](#map/current-snowpack) map, with snow data.
* [2.1.0] Rename the ***Basin Entities / Agriculture - Dairies***
  map to [***Basin Entities / Agriculture - Food and Dairies***](#map/entities-food-and-dairies)
  and add initial local food layer.
* [2.1.0] Add initial [***Future Planning / Municipal - Major Projects***](#map/planning-muni-projects).

## 2.0.0 ##

* [2.0.0] Update based on InfoMapper 2.0.0 release.
* [2.0.0] Used with Go Code Colorado Business Solutions Challenge semi-final.
* [2.0.0] Add water provider boundary layer.
* [2.0.0] Data table for layers has address search feature.

## 1.1.0 ##

* [1.1.0] Update based on InfoMapper 1.4.0 release.
* [1.1.0] Map layers with visualizations now show icon in legend.
* [1.1.0] Raster layer legend and popups have been improved.

## 1.0.0 ##

* [1.0.0] Update based on InfoMapper 1.3.0 release.
* [1.0.0] Kebab menus are used for layer groups and layers to access information and data.
* [1.0.0] Some layer groups are now configured so that only one layer in a group can be selected,
  which increases load speed and avoids overlapping layers.
* [1.0.0] Update DOLA county population data.  Historical estimates include 2019, forecast starts in 2020.
* [1.0.0, 2020-11-28] Add Soil Burn Severity (SBS) to
  [***Current Conditions / Environment - Wildfires***](#map/current-wildfires) map.

## 0.7.0 ##

* [0.7.0] Enable documentation for all layers.
* [0.7.0] Update all the layer event configurations to limit attributes that are shown,
  with most important attributes first.
* [0.7.0] Update population time series data and enable graphs for municipalities.
* [0.7.0] Add initial page for
  [***Current Conditions / Water Supply - Snowpack***](#map/current-snowpack).
  Integrated maps will be added in the future.

## 0.6.0 ##

* [0.6.0] Add data table views for layer attributes and time series.
* [0.6.0] Popup dialogs are now resizable, other than time series graph.

## 0.5.0 ##

* [0.5.0] Update InfoMapper software to use Angular 10.
* [0.5.0] Layer properties can now be viewed.  Data table can be saved as `csv` and layer can be saved as `geojson`.
* [0.5.0] Time series data table can be saved as `csv`.
* [0.5.0] Add continental divide layer to some maps.
* [0.5.0] Enhance time series graph to have ***Data Table*** button and implement initial
  time series data table display.

## 0.4.0 ##

* [0.4.0] Add historical wildfires to current conditions.
* [0.4.0] Each layer now has a "dot dot dot" (kebob) popup menu,
  which will be enhanced over time to add new tools.
  The menu initially allows viewing the layer data table.
* [0.4.0] Fix so image markers for point data are properly positioned at the pointer
  image pointer location.
* [0.4.0] Add separators to group background layers.

## 0.3.0 ##

* [0.3.0] Update GeoProcessor workflow command files to default many identifier parameters,
  which streamlines creating and maintaining maps.
* [0.3.0] Add [***Basin Entities / Water Quality - Monitoring***](#map/entities-wq) map.
* [0.3.0] Wide attribute values are now truncated so that hover dialog is not too wide.
  Date/time attributes shown as integers will cause an auto-generated date/time string to be displayed.
* [0.3.0] Fix bug where zooming and panning sometimes caused polygon layers to not draw completely.
* [0.3.0] Add [***Basin Entities / Physical - Basins***](#map/entities-basins) map with initial HUC basin maps.
* [0.3.0] Add [***Current Conditions / System - Important Notices***](#content-page/current-notices) page for important
  system information.
* [0.3.0] Add additional background map layers, from Esri, Google, and USGS,
  and set the background layer for each map to emphasize the map layers.
* [0.3.0] Add popup documentation for all maps and layers
  in order to provide context to users and provide links to data sources.
* [0.3.0] Add initial [***Current Conditions / Environment - Wildfires***](#map/current-wildfires) map.
* [0.3.0] Uses InfoMapper software version 1.0.0.

## 0.2.0 - 0.2.3 ##

* [0.2.3] Up through this release, development has been on a prototype.
  After this release, focus is on maintaining a production tool.
* [0.2.1] Fix favicon to use OWF logo.
* [0.2.1] Fix bug where polygon layers were not being shown in the proper order on the map.
* [0.2.0] Update to use general InfoMapper software as a platform for the application.
