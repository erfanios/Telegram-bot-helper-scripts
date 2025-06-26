#!/usr/bin/env bash
# SCRIPT: tlg-send-photo.sh 
# AUTHOR: ...
# DATE: 2025-06-27T00:31:46
# REV: 1.0
# ARGUMENTS: [1:        ][2:		][3:		][4:        ]
#
# PURPOSE: Send photo 
#
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure

PHOTO="$1"
CAPTION="$2"

source ~/.telegram/config || {
  echo "Config not found under '~/.telegram/config'."
  exit 1
}

if [ -z "${t_api_key}" ] || [ -z "${t_chat_id}" ]; then
  echo "'t_chat_id' or 't_api_key' not defined in the environment" >&2
  exit 1
fi

curl -s -F chat_id="$t_chat_id" \
     -F photo=@"$PHOTO" \
     -F caption="$CAPTION" \
     "https://api.telegram.org/bot${t_api_key}/sendPhoto"
