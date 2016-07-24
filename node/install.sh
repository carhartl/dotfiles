# Install npm packages
packages=(
jshint
trash-cli
)
for package in ${packages[@]} ; do
  npm install $package --global --quiet
done
