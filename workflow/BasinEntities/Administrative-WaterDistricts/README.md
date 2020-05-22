# BasinEntities / Administrative-WaterDistricts #

This folder contains files for the Colorado Division of Water Resources water districts map.
The command files should be run in the order listed in the table.

| **Step** | **Command File** | **Description** |
| -- | -- | -- |
| 1 | `01a-download-water-districts.gp` | Download water districts layer from OWF CDSS data website and save to `layers` folder. |
| 2 | `01b-download-water-division.gp` | Download water division layer from OWF CDSS data website and save to `layers` folder. |
| 3 | `02b-create-dwr-offices-layer.gp` | Create water division offices layer from Excel file. **Currently not used - instead use the TSTool command file.** |
| 4 | `02b-create-dwr-offices-layer.tstool` | Create water division offices layer from Excel file. |
| 5 | `03-create-map-codwr-waterdistricts.gp` | Create a GeoMapProject file for use with the InfoMapper. |
