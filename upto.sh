#!/bin/bash
function upto() {
	local EXPRESSION="$1"
	if [ -z "$EXPRESSION" ]; then
		echo "A path expression must be provided." >&2
		return 1
	fi
	if [ "$EXPRESSION" = "/" ]; then
		cd "/"
		return 0
	fi
	local CURRENT_PATH="$(pwd)"
	local MATCHED_DIR=""
	local MATCHING=true

	while [ "$MATCHING" = true ]; do
		if [[ "$CURRENT_PATH" =~ "$EXPRESSION" ]]; then
			MATCHED_DIR="$CURRENT_PATH"
			CURRENT_PATH=$(dirname "$CURRENT_PATH")
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
