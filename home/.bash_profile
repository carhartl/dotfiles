# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
	. `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
	. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '