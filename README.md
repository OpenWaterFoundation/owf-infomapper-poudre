# owf-app-poudre-dashboard-workflow #

Open Water Foundation data processing workflow for Poudre Basin Information Platform web application.
This repository contains command files and supporting files to process data products
for the Poudre Basin Information Platform, which includes a web application to view the data.
The output can then be deployed to the cloud for public viewing and can be used in the development environment.
**This repository might in the future be renamed to remove "dashboard".**  See also:

* [owf-app-poudre-dashboard-ng](https://github.com/OpenWaterFoundation/owf-app-poudre-dashboard-ng)
repository for the Poudre Basin Information Portal web application code.
* [Deployed prototype application](http://viz.openwaterfoundation.org/owf-app-poudre-dashboard/home)

The following sections are included in this documentation:

* [Repository Contents](#repository-contents)
* [Development Environment](#development-environment)

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
        owf-app-poudre-dashboard-workflow/     Workkflow files to process input for web application.
```

The repository contains the following:

```
owf-app-poudre-dashboard-workflow/     Workkflow files to process input for web application.
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

* QGIS - open source geographic information system
	+ it is recommended to use the "Standalone Installation" (rather than OSGeo4W suite)
	because multiple versions can be installed at the same time.
	+ QGIS 3.4 was used for initial work on this repository.
	+ QGIS project files (`*.qgs`) are used to prototype maps for the web application.
	+ See [OWF / Learn QGIS](http://learn.openwaterfoundation.org/owf-learn-qgis/) for information on installing QGIS.
* GeoProcessor - open source software for spatial data processing
	+ Automates download and processing of spatial data.
	+ Command files (`*.gp`) in `process` folders indicate how to process spatial data and are
	committed to the repository.
	+ See the [GeoProcessor download page](http://software.openwaterfoundation.org/geoprocessor/)
* TSTool - open source software for time series processing
	+ Automates download and processing of time series data.
	+ Command files (`*.TSTool`) in `process` folders indicate how to process time series data and are
	committed to the repository.
	* See the [TSTool Software page](http://software.openwaterfoundation.org/)
	for installation information
* R - open source statistics softare
	+ Include more information here from Kristin
* Python - open source scripting
	+ Include more information about installing if needed

## Maintainers ##

This repository is maintained by Open Water Foundation staff.
