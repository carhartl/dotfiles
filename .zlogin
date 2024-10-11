#!/usr/bin/env zsh

# Make tools installed via mise available in VS Code
# https://mise.jdx.dev/getting-started.html#_2b-alternative-add-mise-shims-to-path
export PATH="$HOME/.local/share/mise/shims:$PATH"

# Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
