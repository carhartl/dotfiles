#!/bin/sh

set -e

ln -sf "$PWD/default-gems" "$(rbenv root)/default-gems"
