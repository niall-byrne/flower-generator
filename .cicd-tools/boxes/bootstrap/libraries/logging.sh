#!/bin/bash

# Library for logging functions and commands.

set -eo pipefail

# shellcheck source=/dev/null
source "$(dirname -- "${BASH_SOURCE[0]}")/colours.sh"

function log() {
  # USAGE:
  # colour bg [ERROR|WARNING|INFO|DEBUG] [MESSAGE CONTENTS]

  # shellcheck disable=SC2034
  local ERROR="RED"
  # shellcheck disable=SC2034
  local WARNING="YELLOW"
  # shellcheck disable=SC2034
  local INFO="GREEN"
  # shellcheck disable=SC2034
  local DEBUG="CYAN"
  # shellcheck disable=SC2034
  local FUNCTION_NAME="${FUNCNAME[1]}"

  local LEVEL="${1}"
  local MESSAGE="${2}"

  if [[ -z "${!LEVEL}" ]] ||
    [[ -z "${MESSAGE}" ]]; then
    log "ERROR" "Invalid logging statement!"
    return 127
  fi

  echo "[$(date -u)] [$(colour fg "${!LEVEL}")${LEVEL}$(colour clear)] ${MESSAGE}" >> /dev/stderr
}
