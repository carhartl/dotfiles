# dotfiles

## Installation ##

- `git clone https://github.com/carhartl/dotfiles.git ~/.dotfiles`
- `cd ~/.dotfiles`
- `script/bootstrap`

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though. All files and folders ending in `.symlink` get, you guessed it,
symlinked. For example: `~/.dotfiles/vim/vimrc.symlink` gets symlinked to
`~/.vimrc`.
    
## Thanks to…

* [Mathias Bynens][mathiasbynens/dotfiles]
* [Zach Holman][holman/dotfiles]
* [Wynn Netherland][pengwynn/dotfiles]