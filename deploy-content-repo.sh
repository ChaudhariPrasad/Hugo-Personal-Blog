#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mUpdating gitHub content repository...\033[0m\n"

# Commit changes.
msg="updating content repository $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

printf $msg

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Add changes to git.
git add .

# Commit changes.
msg="updating content repository $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
