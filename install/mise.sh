#!/bin/sh
#
# Setup some initial versions
mise install kubectl@1.25.5
mise global kubectl@1.25.5
mise global nodejs@system
mise install python@3.9.4
mise global python@3.9.4
export RUBY_CONFIGURE_OPTS=--with-libyaml-dir=/opt/homebrew/opt/libyaml
mise install ruby@3.2.1
mise global ruby@3.2.1
