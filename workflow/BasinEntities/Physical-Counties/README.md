# BasinEntities / Physical-Counties #

This folder contains files for the counties that overlap the Poudre Basin.
The command files should be run in the order listed in the table.

| **Step** | **Command File** | **Description** |
| -- | -- | -- |
| 1 | NA | Layer file is manually downloaded from [Colorado Information Markeplace Counties in Colorado dataset](https://data.colorado.gov/Transportation/Counties-in-Colorado/67vn-ijga) and saved to the `layers` folder as filename `co-counties.geojson`. |
| 2 | `03-create-map-co-counties.gp` | Create a GeoMapProject file for use with the InfoMapper. |
