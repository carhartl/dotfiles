#!/bin/sh
#
# Install asdf plugins
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add ruby

# Setup some initial versions
asdf global nodejs system
asdf install python 3.9.4
asdf global python 3.9.4
asdf install ruby 3.0.1
asdf global ruby 3.0.1
