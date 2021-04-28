#!/bin/sh

# Copy  files to 'infomapper/src/assets/app' folder.
# Brute force way to provide content to InfoMapper and version control.
# A better way would be to symbolically link InfoMapper 'app' to this `web` folder,
# but that does not seem to work.
# Folder for this script is similar to:
#   /c/Users/user/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre/web

# Supporting functions, alphabetized.

# The variable ${folder} is set to the receiving folder used in calling code.
checkBasinEntitiesFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/BasinEntities
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

# The variable ${folder} is set to the receiving folder used in calling code.
checkCurrentConditionsFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/CurrentConditions
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

# The variable ${folder} is set to the receiving folder used in calling code.
checkFuturePlanningFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/FuturePlanning
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

# The variable ${folder} is set to the receiving folder used in calling code.
checkHistoricalDataFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/HistoricalData
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

# The variable ${folder} is set to the receiving folder used in calling code.
checkSupportingDataFolder() {
  # Make sure that the receiving folder exists
  folder=${appFolder}/data-maps/SupportingData
  if [ ! -d "${folder}" ]; then
    echo "Creating folder ${folder}"
    mkdir -p ${folder}
  fi
}

# Copy roundtables map folder and files.
copy_BasinEntities_Administration_Roundtables() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Administration-Roundtables ${folder}
}

# Copy CO water districts folder and files.
copy_BasinEntities_Administration_WaterDistricts() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Administration-CoDwrWaterDistricts ${folder}
}

# Copy dairies map folder and files.
copy_BasinEntities_Agriculture_FoodAndDairies() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Agriculture-FoodAndDairies ${folder}
}

# Copy ditches map folder and files.
copy_BasinEntities_Agriculture_Ditches() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Agriculture-Ditches ${folder}
}

# Copy education organizations map folder and files.
copy_BasinEntities_Education_Organizations() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Education-Organizations ${folder}
}

# Copy instream flow reaches map folder and files.
copy_BasinEntities_Environment_InstreamFlowReaches() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Environment-InstreamFlowReaches ${folder}
}

# Copy environment organizations map folder and files.
copy_BasinEntities_Environment_Organizations() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Environment-Organizations ${folder}
}

# Copy breweries map folder and files.
copy_BasinEntities_Industry_Breweries() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Industry-Breweries ${folder}
}

# Copy breweries map folder and files.
copy_BasinEntities_Municipal_Municipalities() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Municipal-Municipalities ${folder}
}

# Copy counties map folder and files.
copy_BasinEntities_Political_Counties() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Political-Counties ${folder}
}

# Copy counties map folder and files.
copy_BasinEntities_Political_LegislativeDistricts() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Political-LegislativeDistricts ${folder}
}

# Copy basins map folder and files.
copy_BasinEntities_Physical_Basins() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Physical-Basins ${folder}
}

# Copy stream reaches map folder and files.
copy_BasinEntities_Physical_StreamReaches() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Physical-StreamReaches ${folder}
}

# Copy boating organizations map folder and files.
copy_BasinEntities_Recreation_BoatingOrganizations() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Recreation-BoatingOrganizations ${folder}
}

# Copy trails map folder and files.
copy_BasinEntities_Recreation_Trails() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Recreation-Trails ${folder}
}

# Copy water quality monitoring map folder and files.
copy_BasinEntities_WaterQuality_Monitoring() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/WaterQuality-Monitoring ${folder}
}

# Copy water supply map folder and files.
copy_BasinEntities_WaterSupply_WaterProviders() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/WaterSupply-WaterProviders ${folder}
}

# Copy water supply map folder and files.
copy_BasinEntities_Z_Test1() {
  checkBasinEntitiesFolder
  cp -rv ${scriptFolder}/data-maps/BasinEntities/Z-Test1 ${folder}
}

# Copy current conditions wildfires folder and files.
copy_CurrentConditions_Environment_Wildfires() {
  checkCurrentConditionsFolder
  cp -rv ${scriptFolder}/data-maps/CurrentConditions/Environment-Wildfires ${folder}
}

# Copy current conditions drought monitor folder and files.
copy_CurrentConditions_WaterSupply_Drought() {
  checkCurrentConditionsFolder
  cp -rv ${scriptFolder}/data-maps/CurrentConditions/WaterSupply-Drought ${folder}
}

# Copy current conditions snowpack folder and files.
copy_CurrentConditions_WaterSupply_Snowpack() {
  checkCurrentConditionsFolder
  cp -rv ${scriptFolder}/data-maps/CurrentConditions/WaterSupply-Snowpack ${folder}
}

# Copy current conditions streamflow folder and files.
copy_CurrentConditions_WaterSupply_Streamflow() {
  checkCurrentConditionsFolder
  cp -rv ${scriptFolder}/data-maps/CurrentConditions/WaterSupply-Streamflow ${folder}
}

# Copy future planning municipal major projects folder  and files.
copy_FuturePlanning_Municipal_MajorProjects() {
  checkFuturePlanningFolder
  cp -rv ${scriptFolder}/data-maps/FuturePlanning/Municipal-MajorProjects ${folder}
}

# Copy irrigated lands map folder and files.
copy_HistoricalData_Agriculture_IrrigatedLands() {
  checkHistoricalDataFolder
  cp -rv ${scriptFolder}/data-maps/HistoricalData/Agriculture-IrrigatedLands ${folder}
}

# Copy main configuration folder files.
copyMainConfig() {
  # Make sure that folders exist.
  if [ ! -d "${appFolder}" ]; then
    echo "Creating folder ${appFolder}"
    mkdir -p ${appFolder}
  fi

  # Main application configuration file.
  cp -v ${scriptFolder}/app-config.json ${appFolder}
  # Content pages.
  cp -rv ${scriptFolder}/content-pages ${appFolder}
  # Images.
  cp -rv ${scriptFolder}/img ${appFolder}
  # System.
  cp -rv ${scriptFolder}/system ${appFolder}
}

# Copy continental divide folder and files.
copy_SupportingData_Physical_ContinentalDivide() {
  checkSupportingDataFolder
  cp -rv ${scriptFolder}/data-maps/SupportingData/Physical-ContinentalDivide ${folder}
}

# Copy continental divide folder and files.
copy_SupportingData_Political_ColoradoStateBoundary() {
  checkSupportingDataFolder
  cp -rv ${scriptFolder}/data-maps/SupportingData/Political-ColoradoStateBoundary ${folder}
}

runInteractive() {
  while true; do
    echo ""
    echo "Enter an option to update application data.  Menus are listed in order of application."
    echo ""
    echo "App. Config & Content:   c.       Copy main configuration files."
    echo ""
    echo "Supporting Data:         sc.      Copy Physical - Continental Divide files."
    echo "                         sb.      Copy Political - Colorado State Boundary files."
    echo ""
    echo "Basin Entities:          ea.      Copy Administration - CoDwrWaterDistricts files."
    echo "                         er.      Copy Administration - Roundtables files."
    echo "                         ec.      Copy Political - Counties files."
    echo "                         el.      Copy Political - LegislativeDistricts files."
    echo "                         eb.      Copy Physical - Basins files."
    echo "                         es.      Copy Physical - StreamReaches files."
    echo "                         edi.     Copy Agriculture - Ditches files."
    echo "                         eaf.     Copy Agriculture - Food and Dairies files."
    echo "                         edu.     Copy Education - Organizations files."
    echo "                         ei.      Copy Environment - InstreamFlowReaches files."
    echo "                         eeo.     Copy Environment - Organizations files."
    echo "                         ebrew.   Copy Industry - Breweries files."
    echo "                         emuni.   Copy Municipal - Municipalities files."
    echo "                         eboat.   Copy Recreation - BoatingOrganizations files."
    echo "                         etrail.  Copy Recreation - Trails files."
    echo "                         ewq.     Copy WaterQuality - Monitoring files."
    echo "                         ewp.     Copy WaterSupply - WaterProviders files."
    echo "                         etest1.  Copy Z - Test1 files."
    echo ""
    echo "Historical Data:         hl.      Copy IrrigatedLands map files."
    echo ""
    echo "Current Conditions:      cew.     Copy Environment - Wildfires files."
    echo "                         cwd.     Copy WaterSupply - Drought files."
    echo "                         cwsp.    Copy WaterSupply - Snowpack files."
    echo "                         cws.     Copy WaterSupply - Streamflow files."
    echo ""
    echo "Future Planning:         fmp.     Copy Municipal - Major Projects."
    echo ""
    echo "                         a.       Run all copy commands from above."
    echo "                         q.       Quit"
    echo ""
    read -p "Enter command: " answer

    # Organize the following by menu item.

    if [ "${answer}" = "a" ]; then
      # Supporting Data
      copy_SupportingData_Political_ColoradoStateBoundary
      copy_SupportingData_Physical_ContinentalDivide
      # Basin Entities
      copy_BasinEntities_Administration_WaterDistricts
      copy_BasinEntities_Administration_Roundtables
      copy_BasinEntities_Political_Counties
      copy_BasinEntities_Political_LegislativeDistricts
      copy_BasinEntities_Physical_Basins
      copy_BasinEntities_Physical_StreamReaches
      copy_BasinEntities_Agriculture_Dairies
      copy_BasinEntities_Agriculture_Ditches
      copy_BasinEntities_Education_Organizations
      copy_BasinEntities_Environment_InstreamFlowReaches
      copy_BasinEntities_Environment_Organizations
      copy_BasinEntities_Industry_Breweries
      copy_BasinEntities_Recreation_Boating
      copy_BasinEntities_Recreation_Trails
      copy_BasinEntities_WaterSupply_WaterProviders
      copy_BasinEntities_Z_Test1
      # Historical Data
      copy_HistoricalData_Agriculture_IrrigatedLands
      # Current Conditions
      copy_CurrentConditions_Environment_Wildfires
      copy_CurrentConditions_WaterQuality_Monitoring
      copy_CurrentConditions_WaterSupply_Drought
      copy_CurrentConditions_WaterSupply_Snowpack
      copy_CurrentConditions_WaterSupply_Streamflow
      # Future Planning
      copy_FuturePlanning_Municipal_MajorProjects
    elif [ "${answer}" = "c" ]; then
      copyMainConfig
    elif [ "${answer}" = "q" ]; then
      break

    # Supporting Data

    elif [ "${answer}" = "sb" ]; then
      copy_SupportingData_Political_ColoradoStateBoundary
    elif [ "${answer}" = "sc" ]; then
      copy_SupportingData_Physical_ContinentalDivide

    # Basin Entities

    elif [ "${answer}" = "ea" ]; then
      copy_BasinEntities_Administration_WaterDistricts
    elif [ "${answer}" = "er" ]; then
      copy_BasinEntities_Administration_Roundtables
    elif [ "${answer}" = "ec" ]; then
      copy_BasinEntities_Political_Counties
    elif [ "${answer}" = "el" ]; then
      copy_BasinEntities_Political_LegislativeDistricts
    elif [ "${answer}" = "eb" ]; then
      copy_BasinEntities_Physical_Basins
    elif [ "${answer}" = "es" ]; then
      copy_BasinEntities_Physical_StreamReaches
    elif [ "${answer}" = "eaf" ]; then
      copy_BasinEntities_Agriculture_FoodAndDairies
    elif [ "${answer}" = "edi" ]; then
      copy_BasinEntities_Agriculture_Ditches
    elif [ "${answer}" = "edu" ]; then
      copy_BasinEntities_Education_Organizations
    elif [ "${answer}" = "ei" ]; then
      copy_BasinEntities_Environment_InstreamFlowReaches
    elif [ "${answer}" = "eeo" ]; then
      copy_BasinEntities_Environment_Organizations
    elif [ "${answer}" = "ebrew" ]; then
      copy_BasinEntities_Industry_Breweries
    elif [ "${answer}" = "emuni" ]; then
      copy_BasinEntities_Municipal_Municipalities
    elif [ "${answer}" = "eboat" ]; then
      copy_BasinEntities_Recreation_BoatingOrganizations
    elif [ "${answer}" = "etrail" ]; then
      copy_BasinEntities_Recreation_Trails
    elif [ "${answer}" = "ewq" ]; then
      copy_BasinEntities_WaterQuality_Monitoring
    elif [ "${answer}" = "ewp" ]; then
      copy_BasinEntities_WaterSupply_WaterProviders
    elif [ "${answer}" = "etest1" ]; then
      copy_BasinEntities_Z_Test1

    # Historical Data

    elif [ "${answer}" = "hl" ]; then
      copy_HistoricalData_Agriculture_IrrigatedLands

    # Current Conditions

    elif [ "${answer}" = "cew" ]; then
      copy_CurrentConditions_Environment_Wildfires
    elif [ "${answer}" = "cwd" ]; then
      copy_CurrentConditions_WaterSupply_Drought
    elif [ "${answer}" = "cwsp" ]; then
      copy_CurrentConditions_WaterSupply_Snowpack
    elif [ "${answer}" = "cws" ]; then
      copy_CurrentConditions_WaterSupply_Streamflow

    # Future planning

    elif [ "${answer}" = "fmp" ]; then
      copy_FuturePlanning_Municipal_MajorProjects

    else
      echo "[WARNING] Don't know how to handle menu: ${answer}"
    fi
  done
  return 0
}

# Entry point into script.

scriptFolder=$(cd $(dirname "$0") && pwd)
repoFolder=$(dirname $scriptFolder)
gitReposFolder=$(dirname $repoFolder)
infoMapperRepoFolder=${gitReposFolder}/owf-app-infomapper-ng
infoMapperFolder=${infoMapperRepoFolder}/infomapper
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
