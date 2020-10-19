/*
   SQLite statement to create County table for OWF county dataset.

  CountyName text PRIMARY KEY,
*/
CREATE TABLE IF NOT EXISTS County (
  CountyName NOT NULL,
  State_Abbrev text NOT NULL,
  FIPS_ID text NOT NULL,
  FIPS_ID_Flag text NOT NULL,
  FIPS_wState_ID text NOT NULL,
  GNIS_ID integer NOT NULL,
  GNIS_ID_Flag text NOT NULL,
  DOLA_LG_ID integer NOT NULL,
  DOLA_LG_ID_Flag text NOT NULL,
  IBCC_Basin_CSV text NOT NULL,
  Num_IBCC_Basin integer NOT NULL,
  Comment text DEFAULT ''
);
-- Try using default internal primary key
-- WITHOUT ROWID;
