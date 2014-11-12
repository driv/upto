#!/bin/bash
function _upto() {
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
		echo "No Match."
	fi
}

EXPRESSION="$1"
if [ -z "$EXPRESSION" ]; then
	echo "A folder expression must be provided"
else
 _upto
fi