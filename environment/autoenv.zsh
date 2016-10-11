# $(brew --prefix autoenv) => "/usr/local/opt/autoenv", but that's too slow!
local autoenv_dir="/usr/local/opt/autoenv"
if [[ -e $autoenv_dir/activate.sh ]]; then
  source $autoenv_dir/activate.sh
fi
