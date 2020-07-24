#!/bin/sh
#
# Run a Python server on the 'dist' folder files.

# Entry point into script.

# Get the folder where this script is located since it may have been run from any folder
scriptFolder=$(cd $(dirname "$0") && pwd)
# mainFolder is info-mapper
repoFolder=$(dirname ${scriptFolder})
webFolder=${repoFolder}/web
gitReposFolder=$(dirname ${repoFolder})
# Start must be consistent with Info Mapper...
infoMapperRepoFolder="${gitReposFolder}/owf-app-info-mapper-ng"
infoMapperMainFolder="${infoMapperRepoFolder}/info-mapper"
infoMapperDistFolder="${infoMapperMainFolder}/dist"
# TODO smalers 2020-04-20 is the app folder redundant?
# - it is not copied to S3
infoMapperDistAppFolder="${infoMapperDistFolder}/info-mapper"

# Change to the dist folder, which is the 'info-mapper' folder.
cd ${infoMapperDistAppFolder}

# Run the python server on port 8000
echo "Running http server on port 8000."
echo "Access with http://localhost:8000"
echo "  Stop with Ctrl-c"
python -m http.server 8000
