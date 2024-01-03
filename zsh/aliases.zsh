# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

# Shortcuts
alias reload!=". ~/.zshrc"
alias rehist="fc -RI"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias ws="cd ~/Workspace"
alias e="\${(z)VISUAL:-\${(z)EDITOR}} \${1:-.}"
alias o="open"
alias oo="open ."
alias heroes="osascript -e 'tell application \"iTunes\" to play the playlist named \"git push\"'"
alias todos="rg TODO: -uu -g '!*.git' -g '!venv' -g '!node_modules'"
alias fixmes="rg FIXME: -uu -g '!*.git' -g '!venv' -g '!node_modules'"
alias pbsort="pbpaste | sort | pbcopy"
alias backtunes="rsync -av --delete /Volumes/Musik/Music /Volumes/Backup"
alias backbooks="rsync -av --delete ~/Library/Containers/com.apple.BKAgentService/Data/Documents/iBooks /Volumes/Backup"
alias backnavi="rsync -av --delete ~/Library/Fresh/Backup /Volumes/Backup/maps\ +\ more"
alias tagged="tag -f \* ."
alias x="chmod +x $(ls -tr | tail -1)"
alias jq=jaq

# Suffix aliases
alias -s css=code
alias -s html=code
alias -s js=code
alias -s md=code
alias -s mjs=code
alias -s py=code
alias -s rb=code
alias -s tf=code

# Serve files from current directory
alias serve="python -m http.server"

# When you forget to use 'sudo', just do 'redo' to rerun the last command using sudo.
alias redo='sudo $(fc -ln -1)'

# Lists the ten most used commands
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Lists in one column, hidden files
alias l="ls -1A"

# Lists human readable sizes, hidden files
alias ll="ls -lAh"

# Update all the things
alias update="echo '\e[32m==>\e[0m Homebrew...'; brew update; brew upgrade; echo '\e[32m==>\e[0m mise plugins...'; mise plugins update; echo '\e[32m==>\e[0m Ruby...'; gem update --system; gem update; echo '\e[32m==>\e[0m Python...'; pip install --upgrade pip; echo '\e[32m==>\e[0m Nodejs...'; npm update --location=global npm; npm update --location=global; echo '\e[32m==>\e[0m Rust...'; rustup update"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Clear Apple’s System Logs to improve shell startup speed
alias emptylogs="sudo rm -rfv /private/var/log/asl/*.asl"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# URL-encode/decode strings
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Pretty print all paths
alias path='echo -e ${PATH//:/\\n}'

# Quicklook
alias ql='qlmanage -p "$@" >& /dev/null'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
