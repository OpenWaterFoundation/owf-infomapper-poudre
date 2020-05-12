#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is required
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL
#
# Create symbolic links in the owf-app-info-mapper-ng repository to folders in this
# repository so that the Info Mapper has access to data from this repository.
# This is an alternative to copying the files from one repository to another.
# Using symbolic links requires turning on Developer Mode in Windows 10.

# Supporting functions, alphabetized

# Create a single symbolic link, using Windows mklink
# - first argument is the target (existing file or folder)
# - second argument is the link
# - use Windows mklink so that the link adheres to Windows file system conventions
# - have to use double slash for /c and /d when running Windows command from MinGW, see:
#   https://superuser.com/questions/526736/how-to-run-internal-cmd-command-from-the-msys-shell
#   http://www.mingw.org/wiki/Posix_path_conversion
createSymbolicLink() {
  target=$1
  link=$2
  # Cygpath is available on Cygwin and MinGW
  targetWindows=$(cygpath -w "${target}")
  linkWindows=$(cygpath -w "${link}")

  targetIsFile="no"
  targetIsDir="no"
  if [ -f "${target}" ]; then
    logInfo "Target is a file."
    targetIsFile="yes"
  elif [ -d "${target}" ]; then
    logInfo "Target is a directory."
    targetIsDir="yes"
  fi
  if [ "${targetIsFile}" = "no" -a "${targetIsDir}" = "no" ]; then
	  logWarning "Skipping link.  Target does not exist as file or directory (need to create it?):"
    logWarning "  ${target}"
    logWarning "  ${targetWindows}"
  else
    # Remove the link first if it already exists
    doLink="yes"
    if [ -L "${link}" ]; then
      # Put this before file.
      logInfo "Link exists as symbolic link:  ${link}"
      read -p "Remove [Y/n]? " answer
      if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
        logInfo "Removing existing link."
        rm "${link}"
        if [ $? -ne 0 ]; then
          doLink="no"
        fi
      else
        # Don't want to remove so can't link
        logWarning "Not removing link."
        doLink="no"
      fi
    elif [ -f "${link}" ]; then
      logInfo "Link exists as file:  ${link}"
      read -p "Remove [Y/n]? " answer
      if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
        logInfo "Removing existing file."
        rm "${link}"
        if [ $? -ne 0 ]; then
          doLink="no"
        fi
      else
        # Don't want to remove so can't link
        logWarning "Not removing link."
        doLink="no"
      fi
    elif [ -d "${link}" ]; then
      logInfo "Link exists as directory:  ${link}"
      read -p "Remove [Y/n]? " answer
      if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
        logInfo "Removing existing directory (will fail if not empty)."
        rmdir "${link}"
        if [ $? -ne 0 ]; then
          doLink="no"
        fi
      else
        # Don't want to remove so can't link
        logWarning "Not removing link."
        doLink="no"
      fi
    fi

    # Can only do the link if link does not exist
    # - should have been checked above
    if [ "${doLink}" = "yes" ]; then
      logInfo "target = ${target}"
      logInfo "target (Windows) = ${targetWindows}"
      logInfo "link = ${link}"
      logInfo "link (Windows) = ${linkWindows}"
      read -p "Create link [Y/n]? " answer
      if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
        if [ "${operatingSystem}" = "mingw" ]; then
          if [ "${targetIsFile}" = "yes" ]; then
            logInfo "Executing: cmd //c mklink ${linkWindows} ${targetWindows}"
            cmd //c mklink ${linkWindows} ${targetWindows}
          elif [ "${targetIsDir}" = "yes" ]; then
            logInfo "Executing: cmd //c mklink //d ${linkWindows} ${targetWindows}"
            cmd //c mklink //d ${linkWindows} ${targetWindows}
          fi
        else
          # TODO smalers 2020-05-08 Need to test on Cygwin and Linux.  Should work.
          logError "Script has not been tested on operating system ${operatingSystem}.  Exiting."
          exit 1
        fi
      fi
    fi
  fi
}

# Create symbolic links for all content
# - 'link' is the symbolic link to be created (link to be created)
# - 'target' is the file/folder that it points to (source)
createSymbolicLinks() {
  # Link the app folder
  logInfo "Creating link for application folder 'app'."
  if [ "${fileLocation}" = "here" ]; then
    # Files live in this repo in dist/info-mapper.
    # InfoMapper assets/app -> dist/info-mapper
    target0="${distInfoMapperFolder}"
    link0="${infoMapperAssetsFolder}/app"
    createSymbolicLink "${target0}" "${link0}"
  elif [ "${fileLocation}" = "info-mapper" ]; then
    # Files live in InofMapper repo in assets/app
    # dist/info-mapper -> assets/app
    target0="${infoMapperAssetsFolder}/app"
    link0="${distInfoMapperFolder}"
    createSymbolicLink "${target0}" "${link0}"
  else
    logError "Unknown file location.  Not creating links.  See --files-live* options."
    printUsage
    exit 1
  fi
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

# Get the user's login.
# - Git Bash apparently does not set $USER environment variable, not an issue on Cygwin
# - Set USER as script variable only if environment variable is not already set
# - See: https://unix.stackexchange.com/questions/76354/who-sets-user-and-username-environment-variables
getUserLogin() {
  if [ -z "$USER" ]; then
    if [ ! -z "$LOGNAME" ]; then
      USER=$LOGNAME
    fi
  fi
  if [ -z "$USER" ]; then
    USER=$(logname)
  fi
  # Else - not critical since used for temporary files
}

# Get the Poudre Information Portal version.
# - the version is in the 'assets/app-config.json' file in format:  "version": "0.7.0.dev (2020-04-24)"
getVersion() {
  versionFile="${mainFolder}/src/assets/version.json"
  version=$(grep '"version":' ${versionFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
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

# Parse the command parameters
# - use the getopt command line program so long options can be handled
parseCommandLine() {
  # Single character options
  optstring="hv"
  # Long options
  optstringLong="help,version"
  # Parse the options using getopt command
  GETOPT_OUT=$(getopt --options $optstring --longoptions $optstringLong -- "$@")
  exitCode=$?
  if [ $exitCode -ne 0 ]; then
    # Error parsing the parameters such as unrecognized parameter
    echoStderr ""
    printUsage
    exit 1
  fi
  # The following constructs the command by concatenating arguments
  eval set -- "$GETOPT_OUT"
  # Loop over the options
  while true; do
    #logDebug "Command line option is ${opt}"
    case "$1" in
      --files-live-here) # --files-live-here  Link is info-mapper -> dist/info-mapper
        logInfo "--files-live-here detected"
        fileLocation="here"
        shift 1
        ;;
      --files-live-with-info-mapper) # --files-live-with-info-mapper  Link is info-mapper <- dist/info-mapper
        logInfo "--files-live-here detected"
        fileLocation="info-mapper"
        shift 1
        ;;
      -h|--help) # -h or --help  Print the program usage
        printUsage
        exit 0
        ;;
      -v|--version) # -v or --version  Print the program version
        printVersion
        exit 0
        ;;
      --) # No more arguments
        shift
        break
        ;;
      *) # Unknown option
        logError "" 
        logError "Invalid option $1." >&2
        printUsage
        exit 1
        ;;
    esac
  done
}

# Print the program usage to stderr.
# - calling code must exit with appropriate code
printUsage() {
  echoStderr ""
  echoStderr "Usage:  $programName"
  echoStderr ""
  echoStderr "Create symbolic link in the owf-app-info-mapper-ng assets to files and folders in this repository."
  echoStderr ""
  echoStderr "   dist/info-mapper -> owf-app-info-mapper-ng/info-mapper/src/assets/app   (use --files-live-with-info-mapper)"
  echoStderr "   owf-app-info-mapper-ng/info-mapper/src/assets/app -> dist/info-mapper   (use --files-live-here)"
  echoStderr ""
  echoStderr "This allows the Info Mapper to be used with custom application data without copying files."
  echoStderr ""
  echoStderr "--files-live-here              Files live in this repository (InfoMapper links to dist/info-mapper)."
  echoStderr "--files-live-with-info-mapper  Files live in InfoMapper (dist/info-mapper links to InfoMapper)."
  echoStderr "-h or --help                   Print the usage."
  echoStderr "-v or --version                Print the version and copyright/license notice."
  echoStderr ""
}

# Print the script version and copyright/license notices to stderr.
# - calling code must exit with appropriate code
printVersion() {
  echoStderr ""
  echoStderr "${programName} version ${programVersion} ${programVersionDate}"
  echoStderr ""
  echoStderr "Poudre Information Portal"
  echoStderr "Copyright 2017-2020 Open Water Foundation."
  echoStderr ""
  echoStderr "License GPLv3+:  GNU GPL version 3 or later"
  echoStderr ""
  echoStderr "There is ABSOLUTELY NO WARRANTY; for details see the"
  echoStderr "'Disclaimer of Warranty' section of the GPLv3 license in the LICENSE file."
  echoStderr "This is free software: you are free to change and redistribute it"
  echoStderr "under the conditions of the GPLv3 license in the LICENSE file."
  echoStderr ""
}

# Entry point into the script

# Check the operating system
checkOperatingSystem

# Get the user login
# - necessary for the upload log
getUserLogin

# Get the folder where this script is located since it may have been run from any folder
scriptFolder=$(cd $(dirname "$0") && pwd)
# mainFolder is info-mapper
repoFolder=$(dirname ${scriptFolder})
distFolder="${repoFolder}/dist"
distInfoMapperFolder="${distFolder}/info-mapper"
gitReposFolder=$(dirname ${repoFolder})
# Start must match Info Mapper...
infoMapperRepoFolder="${gitReposFolder}/owf-app-info-mapper-ng"
infoMapperMainFolder="${infoMapperRepoFolder}/info-mapper"
infoMapperAssetsFolder="${infoMapperMainFolder}/src/assets"
# ...end must match Info Mapper
programName=$(basename $0)
programVersion="1.1.0"
programVersionDate="2020-05-05"
logInfo "Script folder:           ${scriptFolder}"
logInfo "Program name:            ${programName}"
logInfo "repoFolder:              ${repoFolder}"
logInfo "distFolder:              ${distFolder}"
logInfo "distInfoMapperFolder:    ${distInfoMapperFolder}"
logInfo "gitReposFolder:          ${gitReposFolder}"
logInfo "infoMapperRepoFolder:    ${infoMapperRepoFolder}"
logInfo "infoMapperMainFolder:    ${infoMapperMainFolder}"
logInfo "infoMapperAssetsFolder:  ${infoMapperAssetsFolder}"

# TODO smalers 2020-05-05 version is not yet used for anything
#getVersion
# logInfo "Product version:   ${version}"

# Parse the command line.
# - Default file location is with InfoMapper so it does not need to deal with symbolic links
fileLocation="info-mapper"
parseCommandLine "$@"

# Create the symbolic links
createSymbolicLinks

logInfo "Run the application with 'ng serve --open' in: ${infoMapperMainFolder}"

# If here, was successful
exit 0
