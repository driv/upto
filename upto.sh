#!/bin/bash
function upto() { 
  local D=${PWD%${PWD#*/*([^/])$1*/}}
  [[ -z "$D" ]] || cd "$D"
}

# complete upto
_upto () {
	# necessary locals for _init_completion
	local cur prev words cword
	_init_completion || return

	COMPREPLY+=( $( compgen -W "${PWD//\// }" -- $cur ) )
}
complete -F _upto upto
