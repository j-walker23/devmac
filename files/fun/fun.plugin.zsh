#!/usr/bin/env zsh

function add_corrects () {
	if [ -f ~/.zsh_nocorrect ]; then
	    while read -r COMMAND; do
	        alias $COMMAND="nocorrect $COMMAND"
	    done < ~/.zsh_nocorrect
	fi
}

function insert_nocorrect {
	local var1="tail -2 .zsh_history| head -1 | awk -F: '{print $3}'"
	print $var1
	local var2=(${(ps:;:)var1})
	print $var2[1]
		# print !! >> ~/.zsh_nocorrect
}

function git_track {
	
	for remote in $(git branch -r); do
		command git branch --track $remote 
	done
	
	for remote in $(git branch -r); do
		command git checkout $remote
		command git pull
	done

}
