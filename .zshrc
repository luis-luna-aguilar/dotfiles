# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=30

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  web-search autojump brew cap gem git git-flow git-extras rails rand-quote
  docker docker-compose history-substring-search
)

source $ZSH/oh-my-zsh.sh

##
# PATH
export PATH=bin:$PATH
export PATH=~/bin:$PATH

# zsh plugins config
export HISTORY_SUBSTRING_SEARCH_FUZZY='makeitfuzzy'

##
# Sourcing

# other environment variables
if [ -e ~/.zsh_env ]; then
  source ~/.zsh_env
fi

# personal preferences
if [ -e ~/.zsh_profile ]; then
  source ~/.zsh_profile
fi
