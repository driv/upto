#!/bin/bash
function upto() { 
  local D="${PWD%"${PWD#*/*([^/])$1*/}"}"
  [[ -z "$D" ]] || cd "$D"
}

# complete upto
_upto () {
	# necessary locals for _init_completion
	local cur prev words cword
	_init_completion || return

	COMPREPLY+=( $( compgen -W "${PWD//\// }" -- $cur ) )
}
# This complete scheme relies on bash_completion, and the subsequent
# _init_completion function to work.
declare -f _init_completion > /dev/null && complete -F _upto upto
