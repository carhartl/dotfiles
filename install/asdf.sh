#!/bin/sh
#
# Install asdf plugins
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add ruby

# Setup some initial versions
asdf install kubectl 1.25.5
asdf global kubectl 1.25.5
asdf global nodejs system
asdf install python 3.9.4
asdf global python 3.9.4
asdf install ruby 3.0.1
asdf global ruby 3.0.1
