#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202107312349-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.pro
# @License           :  LICENSE.md
# @ReadME            :  server.sh --help
# @Copyright         :  Copyright: (c) 2022 Jason Hempstead, Casjays Developments
# @Created           :  Saturday, Jul 09, 2022 13:04 EDT
# @File              :  server.sh
# @Description       :
# @TODO              :
# @Other             :
# @Resource          :
# @sudo/root         :  no
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
PROG="$(basename "$0" 2>/dev/null)"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
SRC_DIR="${BASH_SOURCE%/*}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
if [[ "$1" == "--debug" ]]; then shift 1 && set -xo pipefail && export SCRIPT_OPTS="--debug" && export _DEBUG="on"; fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Check for needed applications
cmd_exists bash || exit 1 # exit 1 if not found
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set variables
exitCode=""
SERVER_SH_CONFIG_FILE="settings.conf"
SERVER_SH_CONFIG_DIR="$HOME/.config/server.sh"
SERVER_SH_OPTIONS_DIR="$HOME/.local/share/server.sh/options"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set functions

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set additional variables

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# bring in user config
[ -f "$SERVER_SH_CONFIG_DIR/$SERVER_SH_CONFIG_FILE" ] &&
  . "$SERVER_SH_CONFIG_DIR/$SERVER_SH_CONFIG_FILE"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Main application
if ! cd "$SRC_DIR"; then
  echo "Failed to cd into $SCRIPTDIR"
  exit 1
fi
echo "entering $PWD and running npm install -y ; npm run start "
npm install -y
npm run dev
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# End application
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# lets exit with code
exit ${exitCode:-$?}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# end
