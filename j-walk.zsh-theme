#!/usr/bin/env zsh

PROMPT='
$fg[cyan]%m: $(virtualenv_prompt_info) $fg[yellow]$(get_pwd)$(put_spacing)$(git_prompt_info)
%{$reset_color%}→ '

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

ENV_PROMPT_PREFIX="(env:"
ENV_PROMPT_SUFFIX=")"


function virtualenv_prompt_info() {
    local name=""
    if [ -n "$VIRTUAL_ENV" ]; then
        name=$(basename $VIRTUAL_ENV)
    fi
    echo "${fg[white]}$ENV_PROMPT_PREFIX${fg[green]}$name$reset_color$ENV_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"


function put_spacing() {
	local git=$(git_prompt_info)
	if [ ${#git} != 0 ]; then
    	((git=${#git} - 10))
	else
    	git=0
	fi

  local env=$(virtualenv_prompt_info)
  if [ ${#env} != 0 ]; then
      ((env=${#env} - 15))
  else
      env=0
  fi

	local termwidth
	(( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${git} - ${env}))

	local spacing=""
	for i in {1..$termwidth}; do
	    spacing="${spacing} "
	done
	echo $spacing
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}



