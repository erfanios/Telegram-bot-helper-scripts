#!/usr/bin/env bash
# SCRIPT: telegram_send_message.sh 
# AUTHOR: ...
# DATE: 2025-06-26T22:10:15
# REV: 1.0
# ARGUMENTS: [1:        ][2:		][3:		][4:        ]
#
# PURPOSE: Sends message to telegram api 
#
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure
source ~/.telelgram/config || {
  echo "Config not found under '~/.telelgram/config'."
  exit 1
}

if [ -z "${t_api_key}" ] || [ -z "${t_chat_id}" ]; then
  echo "'t_chat_id' or 't_api_key' not defined in the environment" >&2
  exit 1
fi

all="$@"

curl -s -X POST https://api.telegram.org/bot${t_api_key}/sendMessage \
	-d chat_id=${t_chat_id} \
	-d text="${all:?'No message provided'}"
