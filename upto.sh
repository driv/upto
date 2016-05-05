#!/bin/bash
function upto() {
	local EXPRESSION="$1"
	if [ -z "$EXPRESSION" ]; then
		echo "A folder expression must be provided." >&2
		return 1
	fi
	if [ "$EXPRESSION" = "/" ]; then
		cd "/"
		return 0
	fi
	local CURRENT_FOLDER="$(pwd)"
	local MATCHED_DIR=""
	local MATCHING=true

	while [ "$MATCHING" = true ]; do
		if [[ "$CURRENT_FOLDER" =~ "$EXPRESSION" ]]; then
			MATCHED_DIR="$CURRENT_FOLDER"
			CURRENT_FOLDER=$(dirname "$CURRENT_FOLDER")
		else
			MATCHING=false
		fi
	done
	if [ -n "$MATCHED_DIR" ]; then
		cd "$MATCHED_DIR"
		return 0
	else
		echo "No Match." >&2
		return 1
	fi
}

# complete upto
_upto () {
	# necessary locals for _init_completion
	local cur prev words cword
	_init_completion || return

	COMPREPLY+=( $( compgen -W "$( echo ${PWD//\// } )" -- $cur ) )
}
# This complete scheme relies on bash_completion, and the subsequent
# _init_completion function to work.
declare -f _init_completion > /dev/null && complete -F _upto upto
