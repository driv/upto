#!/bin/bash
function upto() {
	EXPRESSION="$1"
	if [ -z "$EXPRESSION" ]; then
		echo "A folder expression must be provided." >&2
		return 1
	fi
	CURRENT_FOLDER="$(pwd)"
	MATCHED_DIR=""
	MATCHING=true

	while [ "$MATCHING" = true ]; do
		if [[ "$CURRENT_FOLDER" =~ "$EXPRESSION" ]]; then
			MATCHED_DIR="$CURRENT_FOLDER"
			CURRENT_FOLDER="$(dirname $CURRENT_FOLDER)"
		else
			MATCHING=false
		fi
	done
	if [ -n "$MATCHED_DIR" ]; then
		cd $MATCHED_DIR
	else
		echo "No Match." >&2
		return 1
	fi
	
}
