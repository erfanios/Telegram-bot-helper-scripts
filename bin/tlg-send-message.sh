#!/usr/bin/env bash
# SCRIPT: telegram_send_message.sh 
# AUTHOR: ...
# DATE: 2025-06-26T22:10:15
# REV: 1.0
# ARGUMENTS: [1: Your Message ]
#
# PURPOSE: Sends message to telegram api 
#
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure
source ~/.telegram/config || {
  echo "Config not found under '~/.telelgram/config'."
  exit 1
}

if [ -z "${t_api_key}" ] || [ -z "${t_chat_id}" ]; then
  echo "'t_chat_id' or 't_api_key' not defined in the environment" >&2
  exit 1
fi

# Read stdin into a variable if available
if [ ! -t 0 ]; then
  message="$(cat)"
else
  message="$*"
fi

if [ -z "${message}" ]; then 
	exit 1
fi


curl -s -X POST https://api.telegram.org/bot${t_api_key}/sendMessage \
	-d chat_id=${t_chat_id} \
	-d text="${message}"
