#!/usr/bin/env bash
# SCRIPT: create-mail-forward.sh 
# AUTHOR: ...
# DATE: 2025-06-29T17:26:54
# REV: 1.0
# ARGUMENTS: [1:        ][2:		][3:		][4:        ]
#
# PURPOSE: It creates the ~/.forward file that forwards mails to an tlg-send-message.sh scrip 
#
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure

if [ ! -f "~/bin/tlg-send-message.sh" ]; then
	echo "~/bin/tlg-send-message.sh does not exists. Use deploy."
	exit 1
fi

echo '|${HOME}/bin/tlg-send-message.sh' >> ~/.forward

