# owf-app-poudre-dashboard-workflow #

This repository contains command files and supporting files to process data products
for the Poudre Basin Information Platform,
which uses the OWF InfoMapper web application to view information products.
The output can then be deployed to the cloud for public viewing and can be used in the development environment.
**This repository might in the future be renamed to remove "dashboard".**  See also:

* [owf-app-info-mapper-ng](https://github.com/OpenWaterFoundation/owf-app-info-mapper-ng)
repository for the general InfoMapper web application code.
* [Deployed prototype application](http://poudre.openwaterfoundation.org/latest/)

The following sections are included in this documentation:

* [Repository Contents](#repository-contents)
* [Development Environment](#development-environment)
	+ [Quick Start](#quick-start)
	+ [Development Tools](#development-tools)
	+ [InfoMapper Configuration](#infomapper-configuration)
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
        owf-app-info-mapper-ng/                InfoMapper web application.
        owf-app-poudre-dashboard-workflow/     Workflow files to process input for web application.
```

This repository contains the following:

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
    snapshots/                         Periodic saved snapshots of QGIS files, useful to freeze test data
                                       in the repository so web application developers don't need to regenerate.
                                       This is being evaluated.
```

## Development Environment ##

This section provides an overview of the development environment.

### Quick Start ###

Do the following to quickly set up a new development environment, assuming that development tools are installed.
If development tools have not been previously installed, see the next section for more information.

1. On windows, create a folder `C:\Users\user\owf-dev\App-Poudre-Portal\git-repos`
2. In the above folder, clone the repository:  `git clone https://github.com/OpenWaterFoundation/owf-app-poudre-dashboard-workflow.git`
3. In the above repository, change to `build-util`.
4. Clone other related repositories, including InfoMapper:  `./git-clone-all-ng.sh`
5. Update the InfoMapper working files:
	1. Change to the `git-repos/owf-app-info-mapper-ng/info-mapper` folder.
	2. Install needed modules:  `npm install`
	3. Test: `ng serve --open`  (the application should display in a browser with menu bar title ***Info Mapper***).
6. Configure and test the Poudre portal:
	1. Change to the `git-repos/owf-app-poudre-dashboard-workflow/build-util` folder.
	2. Create symbolic link between InfoMapper files and this repository's files:  `./create-info-mapper-symlinks.sh`  (see [InfoMapper Configuration](#infomapper-configuration) section below for details)
	3. Change to `git-repos/owf-app-info-mapper-ng/info-mapper` folder.
	4. Run the InfoMapper:  `ng serve --open`  (the application should display in a browser with menu bar title ***Poudre Basin Information***).

### Development Tools ###

The development environment for this repository depends primarily on software tools used to process and view data,
including the following.  Install the software in normal default locations.

* Git client:
	+ For example Git for Windows
* InfoMapper - open source web application software to visualize data:
	+ See the [owf-app-info-mapper-ng](https://github.com/OpenWaterFoundation/owf-app-info-mapper-ng) repository for information.
	+ Currently must be cloned - will create an installer in the future.
	+ See [InfoMapper Configuration](#infomapper-configuration) section.
* GeoProcessor - open source software for spatial data processing:
	+ Automates download and processing of spatial data.
	+ Command files (`*.gp`) in `process` folders indicate how to process spatial data and are
	committed to the repository.
	+ See the [GeoProcessor download page](http://software.openwaterfoundation.org/geoprocessor/).
* QGIS - open source geographic information system:
	+ Install the "Standalone Installation" (rather than OSGeo4W suite)
	corresponding to the GeoProcessor version.
	+ QGIS project files (`*.qgs`) are used to prototype maps for the web application
	and correspond to GeoProcessor GeoProjectFile configurations.
	+ See [OWF / Learn QGIS](http://learn.openwaterfoundation.org/owf-learn-qgis/) for information on installing QGIS.
* TSTool - open source software for time series processing:
	+ Automates download and processing of time series data.
	+ Command files (`*.TSTool`) in `process` folders indicate how to process time series data and are
	committed to the repository.
	* See the [TSTool download page](http://software.openwaterfoundation.org/)
	for installation information.
* R - open source statistics software:
	+ Need to fill out if used for product generation.
* Python - open source scripting:
	+ Need to fill out if used for product generation.

### InfoMapper Configuration ###

The InfoMapper is an Angular application, which expects run-time configuration and data files to be
located in `info-mapper/src/assets` folder of the `owf-app-info-mapper-ng` repository working files.
Because the InfoMapper is a general application,
specific configuration and data for this Poudre information project cannot live in the InfoMapper repository.
Two options can be used to provide custom configuration and data to the InfoMapper:

1. Copy files into the InfoMapper `assets/app` folder:
	* This would typically be done with a script, either brute force to copy entire folder trees,
	or with options for selective copies.
	* The downside is that files, perhaps  many files, would need to be repeatedly copied, which can be slow.
	* This option may need to be used if the second option (symbolic links) is not possible,
	for example if the developer cannot enable symbolic links on Windows 10 by turning on Developer Mode.
2. Use symbolic links to point InfoMapper `assets/app` folders to the `dist/info-mapper` folder in this repository:
	* Requires activating Windows 10 features to use symbolic links
	(see [Symlinks in Windows, MinGW, Git, and Cygwin](https://www.joshkel.com/2018/01/18/symlinks-in-windows/)).
	* Requires confirming that symbolic links are working with all technologies involved,
	as indicated in the above article.
	It is recommended to create the symbolic links using Windows
	[mklink](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink) command and
	confirming that other development environment tools work with links,
	in order to do the minimal amount of extra configuration.
	* The `build-util/create-info-mapper-symlinks.sh` script has been tested with Git Bash.

The first option is relatively trivial; however, the second option is used in this repository because
it is more efficient for development.  Testing has been done with Git Bash.
The following describes steps to use symbolic links:

1. Enable Developer Mode in Windows as described in the above article and
[Enable your device for development](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development) article.
Although there are warnings about hightened risk of security issues,
the settings do allow turning off specific features, such as remote access, to reduce concerns.
Many of the Developer Mode features seem to be related to developing Microsoft Store applications,
which is not the focus here.
2. Run the `build-util/create-info-mapper-symlinks.sh` script in this repository
to (re)create the symbolic links in the InfoMapper repository.
Note that any links that are created use full paths so moving the development environment folders
will require recreating the links.
Listing files in the InfoMapper `assets` folder will then show output similar to:

```
lrwxrwxrwx 1 sam 197121 99 May  9 00:53 app -> /c/Users/sam/owf-dev/App-Poudre-Portal/git-repos/owf-app-poudre-dashboard-workflow/dist/info-mapper/
drwxr-xr-x 1 sam 197121  0 May  9 00:02 app-default/
drwxr-xr-x 1 sam 197121  0 May  5 16:40 leaflet/
-rw-r--r-- 1 sam 197121 43 May  5 16:40 version.json
```

Once the links are established, map configurations and related can be created in
this repository in the `dist/info-mapper` folder, and will be visible to the InfoMapper via the symbolic links.
The top-level `data-maps` and `data-ts` folders should always exist but underlying files are in `.gitignore` since
the files are dynamically generated.
A snapshot of the full data files will be saved when the website is published, and other copies can be made if desired.

Run the InfoMapper in its repository as per InfoMapper documentation (e.g., `ng serve --open` in the `info-mapper` folder).

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
