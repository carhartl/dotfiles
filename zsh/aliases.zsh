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
alias todos="rg TODO: -uu -g '!*.git' -g '!venv' -g '!.venv' -g '!node_modules' -g '!dist'"
alias fixmes="rg FIXME: -uu -g '!*.git' -g '!venv' -g '!.venv' -g '!node_modules' -g '!dist'"
alias pbsort="pbpaste | sort | pbcopy"
alias backtunes="rsync -av --delete /Volumes/Musik/Music /Volumes/Backup"
alias x="chmod +x $(ls -tr | tail -1)"
alias jq=jaq
alias now=iso8601

# Serve files from current directory
alias serve="python -m http.server"

# When you forget to use 'sudo', just do 'redo' to rerun the last command using sudo.
alias redo='sudo $(fc -ln -1)'

# Lists the ten most used commands
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Lists in one column, hidden files
alias l="ls -1A"

# Update all the things
alias update-homebrew="brew update; brew upgrade"
alias update-mise="mise up; mise plugins up"
alias update-go="gup update"
alias update-ruby="gem update --system; gem update; gem cleanup"
alias update-python="pip install --upgrade pip"
alias update-js="npm update --location=global npm; npm update --location=global"
alias update="echo '\e[32m==>\e[0m Homebrew...'; update-homebrew; echo -e '\n'; echo '\e[32m==>\e[0m mise...'; update-mise; echo -e '\n'; echo '\e[32m==>\e[0m Go...'; update-go; echo -e '\n'; echo '\e[32m==>\e[0m Ruby...'; update-ruby; echo -e '\n'; echo '\e[32m==>\e[0m Python...'; update-python; echo -e '\n'; echo '\e[32m==>\e[0m JavaScript...'; update-js;"

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

# Pretty print all paths
alias path='echo -e ${PATH//:/\\n}'
