#!/usr/bin/env zsh

# Execute code in the background to not affect the current session
{
	# Compile zcompdump, if modified, to increase startup speed
	zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
	if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
		zcompile "$zcompdump"
	fi
} &|

# Setting the desired PATH does not take effect when put in .zshenv! This is because
# /usr/libexec/path_helper is executed (=> /etc/zprofile) after sourcing .zshenv and
# it will put /usr/bin in front of the current PATH, resulting in macOS's curl at
# /usr/bin/curl being used.
PATH="/opt/homebrew/opt/curl/bin:$PATH"
PATH="$HOME/bin:$PATH"
