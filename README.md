# owf-app-poudre-dashboard-workflow #

This repository contains command files and supporting files to process data products
for the Poudre Basin Information Platform, which includes a web application to view the data.
The output can then be deployed to the cloud for public viewing and can be used in the development environment.
**This repository might in the future be renamed to remove "dashboard".**  See also:

* [owf-app-poudre-dashboard-ng](https://github.com/OpenWaterFoundation/owf-app-poudre-dashboard-ng)
repository for the Poudre Basin Information Portal web application code.
* [Deployed prototype application](http://poudre.openwaterfoundation.org/latest/)

The following sections are included in this documentation:

* [Repository Contents](#repository-contents)
* [Development Environment](#development-environment)
	+ [Info Mapper Configuration](#info-mapper-configuration)
* [Relationship of Application Menus and Maps to Processing Folders](#relationship-of-application-menus-and-maps-to-processing-folders)
* [Maintainers](#maintainers)

--------------

## Repository Contents ##

The following folder structure is recommended for development.
Top-level folders should be created as necessary.
The following folder structure clearly separates user files (as per operating system),
development area (`owf-dev`), product (`App-Poudre-Portal`), repositories for product (`git-repos`),
and specific repositories for the product.
Repository folder names should agree with GitHub repository names.
Scripts in repository folders that process data should detect their starting location
and then locate other folders based on the following convention.

```
C:\Users\user\                                 User's home folder for Windows.
/c/Users/user/                                 User's home folder for Git Bash.
/cygdrive/C/Users/user/                        User's home folder for Cygwin.
/home/user/                                    User's home folder for Linux.
  owf-dev/                                     Work done on Open Water Foundation projects.
    App-Poudre-Portal/                         Poudre Basin Information Portal product, using Angular
                                               (name of this folder is not critical).
      ---- below here folder names should match exactly ----
      git-repos/                               Git repositories for the Angular portal web application.
        owf-app-poudre-dashboard-ng/           Angular web application.
        owf-app-poudre-dashboard-workflow/     Workflow files to process input for web application.
```

The repository contains the following:

```
owf-app-poudre-dashboard-workflow/     Workflow files to process input for web application.
  .git/                                Standard Git software folder for repository (DO NOT TOUCH).
  .gitattributes/                      Standard Git configuration file for repository (for portability).
  .gitignore/                          Standard Git configuration file to ignore dynamic working files.
  build-util/                          Scripts to manage repository, as needed.
  process/                             Command files and scripts to process the data.
    01-xxx/                            Numbered process steps.
  qgis/                                Files that QGIS can use.
    latest/                            Latest files from "process" steps (data files are in gitgnore).
       *.qgs                           QGIS project file, saved in repo to preserve configuration.
    snapshot-YYYY-MM-DD/               Periodic saved snapshots of QGIS files, useful to freeze test data
                                       in the repository so web application developers don't need to regenerate.
```

## Development Environment ##

The development environment for this repository depends primarily on software tools used to process and view data,
including the following.  Install the software in normal default locations.

* Info Mapper - open source web application software to visualize data
	+ See the [owf-app-info-mapper-ng](https://github.com/OpenWaterFoundation/owf-app-info-mapper-ng) repository for information
	+ Currently must be cloned - will create an installer in the future
	+ See [Info Mapper Configuration](#info-mapper-configuration) section
* GeoProcessor - open source software for spatial data processing
	+ Automates download and processing of spatial data.
	+ Command files (`*.gp`) in `process` folders indicate how to process spatial data and are
	committed to the repository.
	+ See the [GeoProcessor download page](http://software.openwaterfoundation.org/geoprocessor/)
* QGIS - open source geographic information system
	+ install the "Standalone Installation" (rather than OSGeo4W suite)
	corresponding to the GeoProcessor version
	+ QGIS project files (`*.qgs`) are used to prototype maps for the web application
	and correspond to GeoProcessor GeoProjectFile configurations.
	+ See [OWF / Learn QGIS](http://learn.openwaterfoundation.org/owf-learn-qgis/) for information on installing QGIS.
* TSTool - open source software for time series processing
	+ Automates download and processing of time series data.
	+ Command files (`*.TSTool`) in `process` folders indicate how to process time series data and are
	committed to the repository.
	* See the [TSTool download page](http://software.openwaterfoundation.org/)
	for installation information
* R - open source statistics softare
	+ Need to fill out
* Python - open source scripting
	+ Need to fill out

### Info Mapper Configuration ###

The Info Mapper is an Angular application, which expects run-time configuration and data files to be
located in `info-mapper/src/assets` folder of the `owf-app-info-mapper-ng` repository working files.
Because the Info Mapper is a general application,
specific configuration and data for this Poudre information project cannot live in the Info Mapper repository.
There are therefore two options to providing the Info Mapper with files:

1. Copy files into the Info Mapper `assets` folder:
	* This would typically be done with a script, either brute force to copy enter trees,
	or with options for selective copies.
	* The downside is that files, perhaps  many files, would need to be repeatedly copied, which can be slow.
	* This option may need to be used if the second option (symbolic links) is not possible.
2. Use symbolic links to point Info Mapper `assets` folders to folders in this repository:
	* Requires activating Windows 10 features to use symbolic links
	(see [Symliks in WIndows, MinGW, Git, and Cygwin](https://www.joshkel.com/2018/01/18/symlinks-in-windows/)).
	* Requires confirming that symbolic links are working with all technologies involved,
	as indicated in the above article.
	It is recommended to create the symbolic links using Windows
	[mklink](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink) command and
	confirming that other technologies work with links,
	in order to do the minimal amount of extra configuration.

The first option is relatively trivial; however, the second option is used in this repository because
it is more efficient for development.  Testing has been done with Git Bash.
The following describes steps to use symbolic links:

1. Enable Developer Mode in Windows as described in the above article and
[Enable your device for development](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development) article.
Although there are warnings about hightened risk of security issues,
the settings do allow turning off specific features to reduce concerns.
Many of the Developer Mode features seem to be related to developing Microsoft Store applications,
which is not the focus.
2. Run the `build-util/create-info-mapper-symlinks.sh` script in this repository
to (re)create the symbolic links in the Info Mapper repository.
Note that the links are full paths so moving the development environment folders
will require recreating the links.
Listing files in the Info Mapper `assets` folder will then show output similar to:

```
lrwxrwxrwx 1 sam 197121  115 May  6 10:49 app-config.json -> /c/Users/sam/owf-dev/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/dist/info-mapper/app-config.json
-rw-r--r-- 1 sam 197121 7153 May  5 23:18 app-config-default.json
lrwxrwxrwx 1 sam 197121  109 May  6 10:49 data-maps -> /c/Users/sam/owf-dev/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/dist/info-mapper/data-maps/
drwxr-xr-x 1 sam 197121    0 May  5 16:40 data-maps-default/
lrwxrwxrwx 1 sam 197121  107 May  6 10:49 data-ts -> /c/Users/sam/owf-dev/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/dist/info-mapper/data-ts/
drwxr-xr-x 1 sam 197121    0 May  5 16:40 events/
drwxr-xr-x 1 sam 197121    0 May  5 16:40 generic-pages/
drwxr-xr-x 1 sam 197121    0 May  5 16:40 img/
drwxr-xr-x 1 sam 197121    0 May  5 16:40 leaflet/
drwxr-xr-x 1 sam 197121    0 May  5 16:40 style/
-rw-r--r-- 1 sam 197121   43 May  5 16:40 version.json
```

Once the links are established, map configurations and related can be created in
this repository in the `dist/info-mapper` folder, and will be visible to the Info Mapper via the symbolic links.
The top-level `data-maps` and `data-ts` folders should always exist but underlying files are in `.gitignore` since
the files are dynamically generated.
A snapshot of the full data files will be saved when the website is published, and other copies can be made if desired.

Run the Info Mapper in its repository as per Info Mapper documentation (e.g., `ng serve --open` in the `info-mapper` folder).

## Relationship of Application Menus and Maps to Processing Folders ##

The web application provides menus, which display context-specific maps, as follows:

| **Menu** | **Submenu** | **Map File** | **Process Folder** |
| -- | -- | -- | -- |
| ***Basin Entities*** | | | |
| | ***Agricultural Ditches*** | | |
| | ***Environmental Entities*** | | |
| | ***Municipalities*** | | |
| | ***Water Providers*** | | |
| ***Current Conditions*** | | | |
| | ***Boating*** | | |
| | ***Drought*** | | |
| | ***Evapotranspiration*** | | |
| | ***Fishing*** | | |
| | ***Reservoirs (Storage)*** | | |
| | ***Snowpack (SNODAS)*** | | |
| | ***Soil Moisture*** | | |
| | ***Streamflow*** | | |
| | ***Wind*** | | |
| | ***Wildfire Burn Areas*** | | |
| ***Seasonal Outlook*** | | | |
| | ***Diversions*** | | |
| | ***Drought*** | | |
| | ***Reservoirs (Storage)*** | | |
| | ***Snow*** | | |
| ***Historical Data*** | | | |
| | ***Diversions*** | | |
| | ***Boating*** | | |
| | ***Municipal Population*** | | |
| | ***Municipal Water Demand*** | | |
| | ***Streamflow*** | | |
| | ***Snow*** | | |
| ***Future Planning*** | | | |
| | ***Agricultural Land Transfer*** | | |
| | ***Climate Change*** | | |
| | ***Municipal Growth*** | | |
| | ***Open Space*** | | |
| | ***Stormwater/Floodplain Plans*** | | |
| | ***Watershed Plans*** | | |

## Maintainers ##

This repository is maintained by Open Water Foundation staff.
