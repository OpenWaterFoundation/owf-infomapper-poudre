[Product]

ProductType = "Graph"
TotalWidth = "600"
TotalHeight = "400"
MainTitleString = "LARIMER County Total Population"
SubTitleString = "Source:  DOLA"

[SubProduct 1]

GraphType = "Line"
LeftYAxisTitlePosition = "LeftOfAxis"
LeftYAxisTitleRotation = "270"
LeftYAxisTitleString = "Total Population"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"
LayoutYPercent = ""

[Data 1.1]

GraphType = "Point"
TSID = "LARIMER.DOLA.Population.Year"
TSAlias = "LARIMER-population"
SymbolSize = "5"
SymbolStyle = "Circle-Filled"

[Data 1.2]

GraphType = "Line"
TSID = "LARIMER.DOLA.Population.Year.filled"
TSAlias = "LARIMER-population-filled"
