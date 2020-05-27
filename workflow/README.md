# process #

**This README needs to be udpated.  Older map workflows have been moved to `x-` folders and will be reworked.
Newer map workflows are organized in folders consistent with application menus,
with a README for each map.**

This folder contains subfolders for data processing steps.
Numbered folders exist for automated data processing steps.
The contents for processing folders are generally ignored from the repository using `.gitignore` files.

* `00-Download-SourceWaterRouteFramework`
	+ The Source Water Route Framework (SWRF) was developed by the
	Colorado Division of Water Resources and derived from the National Hydrography Dataset (NHD).
	The SWRF represents most streams in Colorado, in particular those with water rights or other important features.
	+ The GeoProcessor command file, `swrf-download.gp`, downloads the SWRF for the
	Cache la Poudre River basin (Water District 03) from the Open Water Foundation's
	[Data](http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/) page.
* `01-Download-MunicipalBoundaries`
	+ The TSTool command file, `municipal-boundaries-download.TSTool`,
	downloads the data from the Colorado Department of Local Affairs (DOLA) as a zipped file.
	+ The GeoProcessor command file, `municipal-boundaries-download.gp`,
	further processes the data and saves the data in GeoJSON format.
	+ See the folder's README for further instructions.
* `02-Download-ActiveStreamgages`
	+ The TSTool command file, `active-streamgages.TSTool`,
	reads in telemetry station information accessed from Colorado's Decision Support Systems (CDSS)'s REST web services.
	Data are filtered to only include streamgages in Water District 03.
	+ The command file reads in the CSV file and then saves the data in GeoJSON format.
* `03-Download-DitchServiceAreas`
	+ The GeoProcessor command file, `ditchserviceareas-download.gp`,
	downloads service areas for the Cache la Poudre River basin (Water District 03) from the Open Water Foundation's
	[Data](http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/) page.
* `04-Download-ReservoirLevels`
	+ Reservoir storage levels data are from the Natural Resources Conservation Service (NRCS).
	The NRCS maintains an interactive map of
	[reservoir storage levels](https://www.wcc.nrcs.usda.gov/snow/snow_map.html)
	(click on "Percent of Official Average" under Reservoir Storage).
	+ Currently, OWF has not been able to download data automatically.
	Instead, a CSV file of current levels must be manually downloaded and then read into TSTool for further processing.
	+ The TSTool command file, `reservoir-levels-download.TSTool`,
	reads in the CSV file and then saves the data in GeoJSON format.
* `05-Download-ActiveDitches`
	+ The R file, `active-ditches.R`, reads in administrative structures information
	accessed from Colorado's Decision Support Systems (CDSS)'s REST web services.
	Data are filtered to only include active ditches in Water District 03.
	+ The file accesses data directly from the web and then saves the data in GeoJSON format.
* `06-Download-DroughtMonitor`
	+ The GeoProcessor command file, `droughtmonitor-download.gp`,
	downloads current drought conditions from the
	[U.S. Drought Monitor](https://droughtmonitor.unl.edu/Data/GISData.aspx) as a zipped file.
	+ The zipped file is unzipped and the spatial data are then saved in GeoJSON format.
* `07-Download-SNODAS`
	+ [CDSS SNODAS Tools](http://snodas.cdss.state.co.us/app/index.html) provide access to a
	historical archive of Snow Data Assimilation System (SNODAS)
	data products for Colorado water supply basins.
	SNODAS data are processed daily to calculate Snow Water Equivalent (SWE)
	and Snow Coverage statistics for water supply basins in Colorado.
	Snow Water Equivalent is the estimate of the depth of liquid water contained within the snowpack.
	+ The TSTool command file, `snodas-download.TSTool`, downloads the data from the
	CDSS SNODAS Tools website (from the Data tab, choose the
	Daily Data Latest Date Example in GeoJSON format) in GeoJSON format.
	+ The GeoProcessor command file, `snodas-download.gp`, further processes the data by
	changing the coordinate reference system to match the other data files in this repository.
	+ See the folder's README for further instructions.
* `08-BurnAreas`
	+ The following files show burned areas in the Cache la Poudre River watershed
	from the 2012 High Park Fire and the 2012 Hewlett Gulch Fire.
	OWF received the files from the Coalition for the Poudre River Watershed (CPRW).
	+ `BAERperimeter20120703.shp`
	+ `BAERperimeter20120703Owner.shp`
	+ `co_hewlett_burnarea2012.shp`
	+ `FirePerimeter20120626.shp`
	+ The GeoProcessor command file, `burn-areas.gp`, converts the data from shapefile format into GeoJSON format.
* `09-Municipal-Population`
	+ This folder contains an R file, `municipal-population-dola.R`,
	that directly accesses data from the Colorado Department of Local Affairs (DOLA)'s State Demography Office.
	The Demography Office provides historical population data for
	municipalities and counties and also provides population forecast estimates for counties. 
	+ The R file links the population data to the municipal boundaries
	spatial file downloaded in the `01-Download-MunicipalBoundaries` folder.
	+ See the folder's README for specific data processing steps.
* `10-Configure-Maps`
	+ GeoProcessor command files to create GeoMapProject files for the web application
	+ Input files are read from the output created by previous steps
	+ GeoMapProject files are written to the `owf-app-poudre-dashboard-ng/poudre-dashboard-ng/src/assets` folder
	and configured so that the `dataPath` property points to the data folders.
