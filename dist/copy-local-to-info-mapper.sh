#!/bin/sh

# Copy 'info-mapper-local/' files to 'info-mapper/'.
# Brute force way to provide content to InfoMapper and version control.

scriptFolder=$(cd $(dirname "$0") && pwd)
localFolder="${scriptFolder}/info-mapper-local"
infoMapperFolder="${scriptFolder}/info-mapper"

echo "Copy 'info-mapper-local/' files to 'info-mapper'."
echo "Make sure that edits to app-config.json and content-pages were in 'info-mapper-local'."
read -p "Are you sure [Y/n]? " answer
if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
  cp -v ${localFolder}/app-config.json ${infoMapperFolder}/app-config.json
  cp -rv ${localFolder}/content-pages ${infoMapperFolder}
  cp -rv ${localFolder}/content-pages/home.md ${infoMapperFolder}
else
  echo "Did not copy anything."
fi
