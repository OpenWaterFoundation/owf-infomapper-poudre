#!/bin/sh

# Copy  files to 'info-mapper/src/assets/app' folder.
# Brute force way to provide content to InfoMapper and version control.
# A better way would be to symbolically link InfoMapper 'app' to this `web` folder,
# but that does not seem to work.
# Folder for this script is similar to:
#   /c/Users/user/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre/web

# Supporting functions, alphabetized.

checkHistoricalSimulationFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/HistoricalSimulation
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

checkBasinEntitiesFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/BasinEntities
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

checkCurrentConditionsFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/CurrentConditions
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

checkHistoricalDataFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/HistoricalData
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

copyBreweries() {
  checkBasinEntitiesFolder

  # Copy breweries map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Industry-Breweries ${folder}
}

copyCounties() {
  checkBasinEntitiesFolder

  # Copy counties map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Physical-Counties ${folder}
}

copyCurrentConditionsStreamflow() {
  checkCurrentConditionsFolder

  # Copy current conditions streamflow folder and files
  cp -rv ${scriptFolder}/data-maps/CurrentConditions/WaterSupply-Streamflow ${folder}
}

copyCm2015H2() {
  checkHistoricalSimulationFolder

  # Copy historical simulation map folder and files
  cp -rv ${scriptFolder}/data-maps/HistoricalSimulation/cm2015H2 ${folder}
}

copyDairies() {
  checkBasinEntitiesFolder

  # Copy dairies map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Agriculture-Dairies ${folder}
}

copyHistoricalIrrigatedLands() {
  checkHistoricalDataFolder

  # Copy irrigated lands map folder and files
  cp -rv ${scriptFolder}/data-maps/HistoricalData/Agriculture-IrrigatedLands ${folder}
}

copyInstreamFlowReaches() {
  checkBasinEntitiesFolder

  # Copy instream flow reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/InstreamFlowReaches ${folder}
}

copyMainConfig() {
  # Make sure that folders exist
  if [ ! -d "${appFolder}" ]; then
    echo "Creating folder ${appFolder}"
    mkdir -p ${appFolder}
  fi

  # Main application configuration file
  cp -v ${scriptFolder}/app-config.json ${appFolder}
  # Content pages
  cp -rv ${scriptFolder}/content-pages ${appFolder}
  # Images
  cp -rv ${scriptFolder}/img ${appFolder}
}

copyStreamReaches() {
  checkBasinEntitiesFolder

  # Copy stream reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Physical-StreamReaches ${folder}
}

copyWaterDistricts() {
  checkBasinEntitiesFolder

  # Copy stream reaches map folder and files
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Administrative-CoDwrWaterDistricts ${folder}
}

runInteractive() {
  while true; do
    echo ""
    echo "Enter an option to update application data."
    echo ""
    echo "Config:              c.  Copy main configuration files."
    echo "BasinEntities/:     eb.  Copy Breweries map files."
    echo "                    ec.  Copy Counties map files."
    echo "                    ed.  Copy Dairies map files."
    echo "                    ei.  Copy InstreamFlowReaches map files."
    echo "                    es.  Copy StreamReaches map files."
    echo "                    ew.  Copy CoDwrWaterDistricts map files."
    echo ""
    echo "HistoricalData:     hl.  Copy IrrigatedLands map files."
    echo ""
    echo "CurrentConditions:  cs.  Copy Streamflow map files."
    echo ""
    #echo "h.   Copy HistoricalSimulation/cm2015H2 map files."
    echo ""
    echo "q.  Quit"
    echo ""
    read -p "Enter command: " answer
    if [ "${answer}" = "c" ]; then
      copyMainConfig
    elif [ "${answer}" = "cs" ]; then
      copyCurrentConditionsStreamflow
    #elif [ "${answer}" = "h" ]; then
    #  copyCm2015H2
    elif [ "${answer}" = "eb" ]; then
      copyBreweries
    elif [ "${answer}" = "ec" ]; then
      copyCounties
    elif [ "${answer}" = "ed" ]; then
      copyDairies
    elif [ "${answer}" = "ei" ]; then
      copyInstreamFlowReaches
    elif [ "${answer}" = "es" ]; then
      copyStreamReaches
    elif [ "${answer}" = "ew" ]; then
      copyWaterDistricts
    elif [ "${answer}" = "hl" ]; then
      copyHistoricalIrrigatedLands
    elif [ "${answer}" = "q" ]; then
      break
    fi
  done
  return 0
}

# Entry point into script.

scriptFolder=$(cd $(dirname "$0") && pwd)
repoFolder=$(dirname $scriptFolder)
gitReposFolder=$(dirname $repoFolder)
infoMapperRepoFolder=${gitReposFolder}/owf-app-info-mapper-ng
infoMapperFolder=${infoMapperRepoFolder}/info-mapper
appFolder=${infoMapperFolder}/src/assets/app

echo "Folders for application:"
echo "scriptFolder=${scriptFolder}"
echo "repoFolder=${repoFolder}"
echo "gitReposFolder=${gitReposFolder}"
echo "infoMapperRepoFolder=${infoMapperRepoFolder}"
echo "infoMapperFolder=${infoMapperRepoFolder}"
echo "appFolder=${appFolder}"

# Run interactively. with script exit from that function
runInteractive
