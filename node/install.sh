#!/bin/sh
#
# Install desired npm packages
packages=(
git-unsaved
pure-prompt
trash-cli
)

for package in ${packages[@]} ; do
  npm install $package --global --quiet
done
