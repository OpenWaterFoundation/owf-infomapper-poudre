# qgis #

This folder contains QGIS files needed to open QGIS and view spatial data files.
QGIS is used to organize spatial data layers into groups and define cartography
information such as layer symbols,
which can be reviewed by web application developers.
The QGIS project groups correspond to the tabs in the Poudre Information Portal web application.

Subfolders include:

* `latest/` - the latest files, produced by running the process steps
	+ Only the `*.qgs` file is saved to the repository
	+ Periodically copy to a snapshot folder to save a working QGIS project for
	software developers
* `snapshot-YYYY-MM-DD` - saved snapshots of `latest`, useful to help web application developers.
Each snapshot folder should include a README.md that explains the contents of the snapshot
and why it was saved.
