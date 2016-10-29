# dotfiles

## Installation

    $ git clone https://github.com/carhartl/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ ./script/bootstrap
    $ sudo ./script/setup-zsh-osx

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though. All files and folders ending in `.symlink` get, you guessed it,
symlinked. For example: `~/.dotfiles/git/gitconfig.symlink` gets symlinked to
`~/.gitconfig`.
    
## Inspired by and thanks to…

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Zach Holman](https://github.com/holman/dotfiles)
* [Wynn Netherland](https://github.com/pengwynn/dotfiles)
