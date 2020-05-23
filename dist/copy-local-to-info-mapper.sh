#!/bin/sh

# Copy 'info-mapper-local/' files to 'info-mapper/'.
# Brute force way to provide content to InfoMapper and version control.

scriptFolder=$(cd $(dirname "$0") && pwd)
localFolder="${scriptFolder}/info-mapper-local"
infoMapperFolder="${scriptFolder}/info-mapper"

echo "Copy repository files (app-config.json, content-pages/, img/)"
echo "  from:  ${localFolder}"
echo "    to:  ${infoMapperFolder} (link to InfoMapp 'assets/app' folder)"
echo "Make sure that edits to app-config.json and content-pages are in 'info-mapper-local'."
read -p "Are you sure [Y/n]? " answer

if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
  # Make sure that folders exist
  if [ ! -d "${infoMapperFolder}" ]; then
    echo "Creating folder ${infoMapperFolder}"
    mkdir ${infoMapperFolder}
  fi
  if [ ! -d "${infoMapperFolder}/content-pages" ]; then
    echo "Creating folder ${infoMapperFolder}/content-pages"
    mkdir ${infoMapperFolder}/content-pages
  fi
  if [ ! -d "${infoMapperFolder}/img" ]; then
    echo "Creating folder ${infoMapperFolder}/img"
    mkdir ${infoMapperFolder}/img
  fi

  # Main application configuration file
  cp -v ${localFolder}/app-config.json ${infoMapperFolder}/app-config.json
  # Content pages
  cp -rv ${localFolder}/content-pages ${infoMapperFolder}
  cp -rv ${localFolder}/content-pages/home.md ${infoMapperFolder}
  # Images
  cp -v ${localFolder}/img/brewery.png ${infoMapperFolder}/img/brewery.png
  cp -v ${localFolder}/img/brewery2.png ${infoMapperFolder}/img/brewery2.png
else
  echo "Did not copy anything."
fi
