#!/bin/bash
#
# Harvest data by running data downloads processes each day.
# - TODO smalers 2021-04-21 this works for Steve Malers' dev machine and needs to be generalized

# Supporting functions, alphabetized.

# Determine the aws script
# - figures out the location of the 'aws' script for Cygwin and MinGW (Git Bash)
checkAws() {
  if [ -z "${operatingSystem}" ]; then
    logError "Operating system has not been set.  Need to fix script."
    exit 1
  elif [ "${operatingSystem}" = "cygwin" -o "${operatingSystem}" = "linux" ]; then
    # Assume that 'aws' is in a standard location such as /usr/bin/aws
    awsScript="aws"
  elif [ "${operatingSystem}" = "mingw" ]; then
    # For Windows Python 3.7, aws may be installed in Windows %USERPROFILE%\AppData\Local\Programs\Python\Python37\scripts
    # - use Linux-like path to avoid backslash issues
    # - TODO smalers 2019-01-04 could try to find if the script is in the PATH
    # - TODO smalers 2019-01-04 could try to find where py thinks Python is installed but not sure how
    awsScript="${HOME}/AppData/Local/Programs/Python/Python37/scripts/aws"
    if [ ! -f "${awsScript}" ]; then
      logError ""
      logError "Can't find 'aws' script"
      exit 1
    fi
  else
    logError ""
    logError "Don't know how to run on operating system ${operatingSystem}"
    exit 1
  fi
  logInfo "aws script is: ${awsScript}"
}

# Determine the operating system that is running the script
# - mainly care whether Cygwin or MINGW (Git Bash)
checkOperatingSystem() {
  if [ ! -z "${operatingSystem}" ]; then
    # Have already checked operating system so return
    return
  fi
  operatingSystem="unknown"
  os=$(uname | tr [a-z] [A-Z])
  case "${os}" in
    CYGWIN*)
      operatingSystem="cygwin"
      ;;
    LINUX*)
      operatingSystem="linux"
      ;;
    MINGW*)
      operatingSystem="mingw"
      ;;
  esac
}

# Echo to stderr
# - if necessary, quote the string to be printed
# - this function is called to print various message types
echoStderr() {
  echo "$@" 1>&2
}

# Get the InfoMapper version and Poudre Information Portal version.
# - the version is in the 'web/app-config.json' file in format:  "version": "0.7.0.dev (2020-04-24)"
# - the Info Mapper software version in 'assets/version.json' with format similar to above
# - set variables ${appVersion} and ${infoMapperVersion}
getVersion() {
  # Application version
  if [ ! -f "${appConfigFile}" ]; then
    logError "Application version file does not exist: ${appConfigFile}"
    logError "Exiting."
    exit 1
  fi
  appVersion=$(grep '"version":' ${appConfigFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
  # InfoMapper version
  infoMapperVersionFile="${infoMapperMainFolder}/src/assets/version.json"
  if [ ! -f "${infoMapperVersionFile}" ]; then
    logError "InfoMapper version file does not exist: ${infoMapperVersionFile}"
    logError "Exiting."
    exit 1
  fi
  infoMapperVersion=$(grep '"version":' ${infoMapperVersionFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
}

# Print a DEBUG message, currently prints to stderr.
logDebug() {
   echoStderr "[DEBUG] $@"
}

# Print an ERROR message, currently prints to stderr.
logError() {
   echoStderr "[ERROR] $@"
}

# Print an INFO message, currently prints to stderr.
logInfo() {
   echoStderr "[INFO] $@"
}

# Print an WARNING message, currently prints to stderr.
logWarning() {
   echoStderr "[WARNING] $@"
}

# Script entry point.

awsProfile=$1
# Use the following to try a dry run
#dryrun="--dryrun"
dryrun=""

if [ -z ${awsProfile} ]; then
  echo "Specify AWS profile as first argument"
  exit 1
fi

# The script is in the Poudre Information Website folder.
scriptFolder=$(cd $(dirname "$0") && pwd)
repoFolder=$(dirname ${scriptFolder})
gitReposFolder=$(dirname ${repoFolder})
infomapperFolder=${gitReposFolder}/owf-app-infomapper-ng/infomapper
srcCurrentConditionsFolder=${infomapperFolder}/src/assets/app/data-maps/CurrentConditions
distCurrentConditionsFolder=${infomapperFolder}/dist/infomapper/assets/app/data-maps/CurrentConditions
workflowFolder=${repoFolder}/workflow

# Check the operating system
checkOperatingSystem

tstoolExe="/C/CDSS/TSTool-13.03.00dev"
gpExe="/C/Users/sam/owf-dev/GeoProcessor/git-repos/owf-app-geoprocessor-python/scripts/gpdev.bat"

# Set the ${awsScript} to run
checkAws

# S3 folder for upload
# - put before parseCommandLine so can be used in print usage, etc.
# - TODO smalers 2020-04-20 does this need an app folder at end like "/owf-app-poudre-dashboard"?
# - for now don't copy to assets folder in cloud
#getVersion
logInfo "Application version:  ${appVersion}"
logInfo "InfoMapper version:   ${infoMapperVersion}"
s3CdssFolder="s3://data.openwaterfoundation.org/CO/CDSS"
s3SnodasFolder="s3://data.openwaterfoundation.org/CO/CDSS/SNODAS"
s3FolderVersionUrl="s3://poudre.openwaterfoundation.org/${appVersion}"
s3FolderLatestUrl="s3://poudre.openwaterfoundation.org/latest"

gpCommandFiles=(
${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/01a-download-snodas-latest.gp
)

for gpCommandFile in ${gpCommandFiles}; do
  echo "Running GeoProcessor command file: ${gpCommandFile}"
  if [ ! -f "${gpCommandFile}" ]; then
    echo "Command file does not exist (skipping):  ${gpCommandFile}"
    continue
  fi
  # cmd //C ${gpExe} /h
  cmd //C ${gpExe} //s3.10 --commands ${gpCommandFile}
  echo "Exit status from GeoProcessor cmd is $?"
done

# Manually copy the resulting layer file to infomapper files.
# - copying only to src/assets does not result in upload because --nobuild does not recreate dist
# - have to copy to dist manually so that AWS sync will see the new file

echo "CurrentConditions folder for deployed InfoMapper: ${srcCurrentConditionsFolder}"
if [ ! -d "${srcCurrentConditionsFolder}" ]; then
  echo "CurrentConditions folder does not exist:  ${srcCurrentConditionsFolder}"
  exit 1
fi
#echo "Copy the snodas.geojson file to: ${srcCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson"
#cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${srcCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson
#echo "Copy the snodas.geojson file to: ${assetsCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson"
#cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${distCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson
echo "Copy the SnowpackStatisticsByDate_LatestDate.geojson file to: ${s3SnodasFolder}/SnowpackStatisticsByDate_LatestDate.geojson"
${awsScript} s3 cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/SnowpackStatisticsByDate_LatestDate.geojson ${s3SnodasFolder}/SnowpackStatisticsByDate_LatestDate.geojson ${dryrun} --profile ${awsProfile}

#echo "Copy the snodas.geojson file to: ${srcCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson"
#cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${srcCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson
#echo "Copy the snodas.geojson file to: ${assetsCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson"
#cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${distCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson

# Don't run the sync program here.
# - this can lead to problems because if someone else runs and uploads the Angular bundle files could be different
#   and cause a full upload again
# - because specific file locations are known, only copy the specific files
# - even running 'copy-to-owf-amazon-s3.sh --nobuild' could have unforeseen sync issues

# echo "Sync files to AWS S3"
#./copy-to-owf-amazon-s3.sh --nobuild --aws-profile=${awsProfile} ${dryrun}

exit 0
