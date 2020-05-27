# Physical-StreamReaches/doc #

This folder contains files for the ***Physical - Stream Reaches*** product.

* [Introduction](#introduction)
* [Data Sources](#data-sources)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Physical - Stream Reaches*** map illustrates the locations of streams on the landscape.
The stream reaches layer is a foundational layer that is displayed on many maps.

## Data sources ##

The following are data sources for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Source Water Route Framework (SWRF) | Stream linework with each stream corresponding to a single line.  CO DWR processed USGS NHD layer to merge linework into lines that correspond to rivers and streams. |
The data is originally from a statewide ayer downloaded from the State of Colorado CDSS website.  It was then processed by OWF to split into water district layer and is available on the [CDSS Spatial Datasets for Colorado Water Districts and Divisions](http://data.openwaterfoundation.org/co/cdss-data-spatial-bybasin/) website.  **The OWF dataset is older and uses GeoJSON 1 specification.  The workflow reads the old GeoJSON and writes in latest specification. |

## Files ##

The following files and folders are used.

| **File/Folder** | **Repo Ignore** | **Description** | 
| -- | -- | -- |
| `01a-download-swrf.gp` | | Download data. |
| `03-create-map-stream-reaches.gp` | | Create map. |
| `doc/` | | This README. |
| `layers/` | Yes - for generated files. | Layers used in the map. |
| `stream-reaches.json` | Yes | Map configuration file. |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File** | **Description** |
| -- | -- |
| `01a-download-swrf.gp` | Download the stream reaches from OWF data website and rewrite to ensure latest GeoJSON format. |
| `03-create-map-stream-reaches.gp` | | Create the map configuration file and copy map and layer files to the distribution folder. |
