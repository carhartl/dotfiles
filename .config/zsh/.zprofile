#!/bin/zsh

# Compile zcompdump, if modified, in background to increase startup speed.
{
	local zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
	if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
		if command mkdir "${zcompdump}.zwc.lock" 2>/dev/null; then
			zcompile "$zcompdump"
			command rmdir "${zcompdump}.zwc.lock" 2>/dev/null
		fi
	fi
} &|

# Setting the desired PATH does not take effect when put in .zshenv! This is because
# /usr/libexec/path_helper is executed (=> /etc/zprofile) after sourcing .zshenv and
# it will put /usr/bin in front of the current PATH, resulting in macOS's curl at
# /usr/bin/curl being used.
PATH="/opt/homebrew/opt/curl/bin:$PATH"
PATH="$HOME/bin:$PATH"
