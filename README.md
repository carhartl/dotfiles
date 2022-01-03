# dotfiles

## Requirements

- Git
- Curl

## Install

```bash
curl -Lks https://git.io/JSg3X | /bin/bash
curl -Lks https://raw.githubusercontent.com/carhartl/dotfiles/master/bin/bootstrap | /bin/bash
```

## Optional

Add local git configuration:

```bash
cp .gitconfig.local{.example,}
```

^ Adapt the placeholders!

Setup macOS to use up-to-date homebrew zsh:

```bash
sudo ./bin/setup-zsh-macos
```

## Inspired by and thanks to…

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://github.com/holman/dotfiles)
- [Wynn Netherland](https://github.com/pengwynn/dotfiles)
