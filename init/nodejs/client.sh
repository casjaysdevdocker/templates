#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202107312349-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.com
# @License           :  LICENSE.md
# @ReadME            :  client.sh --help
# @Copyright         :  Copyright: (c) 2022 Jason Hempstead, Casjays Developments
# @Created           :  Saturday, Jul 09, 2022 13:02 EDT
# @File              :  client.sh
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
type -P bash node &>/dev/null || exit 1 # exit 1 if not found
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set variables
exitCode=""
CLIENT_SH_CONFIG_FILE="settings.conf"
CLIENT_SH_CONFIG_DIR="$HOME/.config/client.sh"
CLIENT_SH_OPTIONS_DIR="$HOME/.local/share/client.sh/options"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set functions

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set additional variables

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# bring in user config
[ -f "$CLIENT_SH_CONFIG_DIR/$CLIENT_SH_CONFIG_FILE" ] &&
  . "$CLIENT_SH_CONFIG_DIR/$CLIENT_SH_CONFIG_FILE"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Main application
if ! cd "$SRC_DIR"; then
  echo "Failed to cd into $SCRIPTDIR"
  exit 1
fi
echo "entering $PWD and running npm install -y ; npm run start "
npm install -y
npm run start

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# End application
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# lets exit with code
exit ${exitCode:-$?}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# end
