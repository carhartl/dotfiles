# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

# Ignore in history
alias cd=" cd"
alias ls=" ls"

# Shortcuts
alias reload!=". ~/.zshrc"
alias dots="cd ~/.dotfiles"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias ws="cd ~/Workspace"
alias e="\${(z)VISUAL:-\${(z)EDITOR}} \${1:-.}"
alias o="open"
alias oo="open ."
alias cl="clear"
alias heroes="osascript -e 'tell application \"iTunes\" to play the playlist named \"git push\"'"
alias todos="rg TODO: -uu -g '!*.git'"
alias fixmes="rg FIXME: -uu -g '!*.git'"
alias pbsort="pbpaste | sort | pbcopy"
alias backtunes="rsync -av --delete /Volumes/Musik/iTunes /Volumes/Backup"
alias backbooks="rsync -av --delete ~/Library/Containers/com.apple.BKAgentService/Data/Documents/iBooks /Volumes/Backup"
alias backnavi="rsync -av --delete ~/Library/Fresh/Backup /Volumes/Backup/maps\ +\ more"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app"
alias h\?="history | grep"
alias tagged="tag -f \* ."

# Lists the ten most used commands
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Lists in one column, hidden files
alias l="ls -1A"

# Lists human readable sizes, hidden files
alias ll="ls -lAh"

# Update Homebrew, installed Ruby gems, npm, and their installed packages
alias update="brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; gem update --system; gem update;"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Clear Apple’s System Logs to improve shell startup speed
alias emptylogs="sudo rm -rfv /private/var/log/asl/*.asl"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Pretty print all paths
alias path="echo -e ${PATH//:/\\n}"

# Quicklook
alias ql='qlmanage -p "$@" >& /dev/null'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
