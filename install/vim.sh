#!/bin/sh
#
# Set up plugins
plugindir=~/.vim/pack/bundle/start
mkdir -p "$plugindir"
if [ -d "$plugindir/vim-grammarous" ]; then
  echo "  Updating vim-grammarous"
  cd "$plugindir/vim-grammarous" || exit
  git pull
else
  echo "  Installing vim-grammarous"
  git clone  --depth 1 https://github.com/rhysd/vim-grammarous.git "$plugindir/vim-grammarous"
fi
