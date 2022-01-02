# dotfiles

## Installation

```bash
git clone --bare https://github.com/carhartl/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
config checkout
config config status.showUntrackedFiles no
cd $HOME/.dotfiles
./script/bootstrap
sudo ./script/setup-zsh-macos
```

## Inspired by and thanks to…

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://github.com/holman/dotfiles)
- [Wynn Netherland](https://github.com/pengwynn/dotfiles)
