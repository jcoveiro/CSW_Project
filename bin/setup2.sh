#!/bin/bash
TEMP_PIPE="/tmp/temp_info_pipe"

exec 3<> "$TEMP_PIPE"

while true; do
	if read -r buffer <&3; then
		echo "$buffer"
	else
		break
	fi
done

exec 3<&-
