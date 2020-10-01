#!/bin/zsh

###
 # Watch debug.log
 #
 # @since 6/21/16
 # @since 1.0.0
 ##
function tdl {
	if [[ ! $(pwd) == *"content"* ]]; then
		echo "Not in wp-content." && return
	fi

	if ! [ -e ./debug.log ]; then
		touch "debug.log"
	fi

 if [[ "$@" == *"--clear"* ]]; then
  clear
 fi

 	if ! [[ -x $(command -v rainbow) ]]; then
		 echo "Please install rainbow:";
		 echo "\tHomebrew: brew install rainbow"
		 return
	 fi

	rainbow --red="error|Fatal|fatal|Error|PHP\s Fatal|WordPress\sdatabase\serror" --yellow="warning|PHP\sWarning|PHP\sNotice" --magenta="line\s[0-9]+" --green="\/Users\/.*\.php" --blue="^\[.*\]" tail -f debug.log
}
