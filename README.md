# dotfiles

## Install

```bash
curl -Lks https://git.io/JSg3X | /bin/bash
```

## Optional

Add local git configuration:

```bash
cp .gitconfig.local{.example,}
```

To add additonal, local-only configuration:

```bash
cp .localrc{.example,}
```

^ Adapt the placeholders!

Use `~/.ssh/config.d/local` to maintain a local SSH config that shouldn’t go into dotfiles.

## Inspired by and thanks to…

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://github.com/holman/dotfiles)
- [Wynn Netherland](https://github.com/pengwynn/dotfiles)
