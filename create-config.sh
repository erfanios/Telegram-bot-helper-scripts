#!/usr/bin/env bash
# SCRIPT: create-config.sh 
# AUTHOR: ...
# DATE: 2025-06-26T22:41:59
# REV: 1.0
# ARGUMENTS: [1:        ][2:		][3:		][4:        ]
#
# PURPOSE: Creates the empty config file 
#
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure

if [ -f ~/.telelgram/config ]; then
	echo "Config already exists under '~/.telelgram/config'" >&2
	exit 1
fi

umask 077
mkdir -p ~/.telelgram
echo 't_chat_id=<replace>' > ~/.telelgram/config
echo 't_api_key="<replace:replace>"' >> ~/.telelgram/config

echo Done
