# water-supply-basin

This folder contains files necessary to create the ***Water Supply (for Basin) Dashboard***.

The `*.tstool` files are [TSTool](https://opencdss.state.co.us/tstool/) command files,
which are run to automate data download and creation of files used by the website.
The most important files are described below.

| **File** | **Description** |
| -- | -- |
| `download-drought-monitor.tstool` | Process the US Drought Monitor files for the water supply dashboard. |
| `download-reservoir-storage.tstool` | Process the NRCS AWDB web services reservoir storage for the water supply dashboard. |
| `download-streamflow.tstool` | Process the Colorado Division of Water Resources streamflow for the water supply dashboard. |
| `download-swsi.tstool` | Process the Colorado Information Marketplace (CIM) Surface Water Supply Index for the water supply dashboard. |
| `*classification.csv` | Classification files used to tell indicator what symbol to show. |
| `*template.tsp` | TSTool time series product file to describe charts, used by the TSTool software. |
| `*template.json` | TSTool time series product file to describe charts, output by TSTool and used by the InfoMapper software. |
| `downloads/` | Files that are downloaded during processing, ignored from the repository but may be used by the dashboard. |
| `results/` | Files that are created during processing, ignored from the repository but may be used by the dashboard. |
