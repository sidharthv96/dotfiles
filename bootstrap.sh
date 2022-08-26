#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;
pwd 
function doIt() {
	rsync --exclude-from "rsync_exclude" -avh --no-perms . ~;
	echo "Regenerating Karabiner config..."
	goku;
  echo "Start a new shell session to see updates."
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	diff -rub ~ . | grep -v "Only in "
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;