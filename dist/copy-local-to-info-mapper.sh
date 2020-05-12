#!/bin/sh

# Copy 'info-mapper-local/' files to 'info-mapper/'.
# Brute force way to provide content to InfoMapper and version control.

scriptFolder=$(cd $(dirname "$0") && pwd)
localFolder="${scriptFolder}/info-mapper-local"
infoMapperFolder="${scriptFolder}/info-mapper"

cp -v ${localFolder}/app-config.json ${infoMapperFolder}/app-config.json
cp -rv ${localFolder}/content-pages ${infoMapperFolder}
