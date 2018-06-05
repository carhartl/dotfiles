#!/bin/sh

set -e

eval "$(rbenv init -)" # Ensure the .rbenv directory has been created when running this
ln -sf "$PWD/default-gems" "$(rbenv root)/default-gems"
