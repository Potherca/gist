#!/usr/bin/env bash

#/ ==============================================================================
#/                          Convert image to ASCII
#/ ==============================================================================
#/
## Usage: image-to-ascii <source-image> [jp2a-arguments...]
##
## Where:
##       - <source-image> is the path of the image to create ASCII output from
##       - [jp2a-arguments...] are any arguments that should be passed to JP2A
##
## Call "image-to-ascii --help" for more details
## Call "image-to-ascii --help-jp2a" for more details about JP2A
##
#/ JP2A (as the name suggests) convert JPEG files to ASCII text. However, if an
#/ image is of another type than JPEG (for instance SVG), JP2A does not work.
#/
#/ This script converts a given image to JPG using "ImageMagick" and then passes
#/ the JPEG to "jp2a" to convert it to ASCII.
#/
#/ If the image is an SVG the image will first be converted to PNG (to conserve
#/ transparency), using "rsvg-convert".
#/
#/ Parameters can be given to pass on to further configure JP2A.
#/
# ==============================================================================

# ==============================================================================
# GNU General Public License,
#
#   Copyright (c) 2017 Potherca
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ==============================================================================

set -o errexit  # Exit script when a co  and exits with non-zero status. Append "|| true" if you expect an error.
set -o errtrace # Exit on error inside any functions or sub-shells.
set -o nounset  # Exit script on use of an undefined variable. Use ${VAR:-} to use an undefined VAR
set -o pipefail # Return exit status of the last co  and in the pipe that failed
# ==============================================================================

source 'functions.common.sh'

# ==============================================================================
# GLOBALS
# ==============================================================================
readonly EXIT_OK=0
readonly ERROR_NOT_ENOUGH_PARAMETERS=65

# ==============================================================================
# RUN LOGIC
# ------------------------------------------------------------------------------
main() {
    local aParameters bShowHelp bShowUpstreamHelp iExitCode sImageType sImage

    bShowHelp=false
    bShowUpstreamHelp=false

    iExitCode="${EXIT_OK}"

    for sParam in "$@";do
        if [ "${sParam}" = "--help" ];then
            bShowHelp=true
        fi
        if [ "${sParam}" = "--help-jp2a" ];then
            bShowUpstreamHelp=true
        fi
    done

    if [[ "${bShowUpstreamHelp}" = true ]];then
      jp2a --help
      echo ""
      echo 'Call "man jp2a" for full details.'
    elif [[ "${bShowHelp}" = true ]];then
        print_usage_full
        print_usage_short
    elif [[ "$#" < 1 ]];then
        iExitCode=${ERROR_NOT_ENOUGH_PARAMETERS}
        print_error_message 'This script expects at least one command-line argument'
        print_usage_short
    else
      sImage="${1}"
      shift
      aParameters=("${@:-}")

      sExtension=$(identify -format %m "${sImage}" | tr '[:upper:]' '[:lower:]')

      if [[ "${sExtension}" = "svg" ]];then
        rsvg-convert "${sImage}" \
            | convert - -flatten jpeg:- \
            | jp2a - "${aParameters[@]}"
      else
        convert "${sImage}" -flatten jpeg:- \
            | jp2a - "${aParameters[@]}"
      fi
    fi

    return ${iExitCode}
}

# ==============================================================================

main "$@"

#EOF
