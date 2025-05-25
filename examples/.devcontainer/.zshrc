# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load paths
if [ -e $HOME/.config_shell/.sh_paths ]; then
    source $HOME/.config_shell/.sh_paths
fi

# Load aliases
if [ -e $HOME/.config_shell/.sh_aliases ]; then
    source $HOME/.config_shell/.sh_aliases
fi

# Load functions
if [ -e $HOME/.config_shell/.sh_functions ]; then
    source $HOME/.config_shell/.sh_functions
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

plugins=(
  docker
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  zsh-ai-complete
  zsh-smart-insert
)

# fd configuration for fzf
export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden --exclude .git --exclude node_modules'

# fzf configuration for oh my zsh
export FZF_BASE="/usr/sbin/"
export FZF_DEFAULT_OPTS="--reverse --border --exact --height=50% --bind 'Ctrl-s:toggle-sort'"
# export FZF_DEFAULT_OPTS="--height 40% --reverse --bind 'Ctrl-s:toggle-sort'"
# To find files
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--height 40% --reverse"
# export FZF_CTRL_T_OPTS="--bind 'Ctrl-r:history-incremental-search-backward'"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# To find in the shell history
export FZF_CTRL_R_OPTS="--height 100% --reverse"
# To change to found directories
export FZF_ALT_C_COMMAND='fd --type directory --follow --hidden --exclude .git --exclude node_modules'
export FZF_ALT_C_OPTS="--height 100% --reverse"
# --preview "bat --color=always --style=numbers --line-range=:500 {}

source $ZSH/oh-my-zsh.sh

source $ZSH/custom/plugins/zsh-histdb/sqlite-history.zsh
# Reverse isearch <https://github.com/larkery/zsh-histdb#reverse-isearch>
source $ZSH/custom/plugins/zsh-histdb/histdb-interactive.zsh
autoload -Uz add-zsh-hook

# To customize prompt, run `p10k configure` or edit /tmp/vscode-zsh/.p10k.zsh.
# [[ ! -f /tmp/vscode-zsh/.p10k.zsh ]] || source /tmp/vscode-zsh/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use 1> /dev/null
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default 1> /dev/null
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set the strategy to find on the histdb history
ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
# ZSH_AUTOSUGGEST_STRATEGY=histdb_top

# GPG
# export GPG_TTY=$(tty)

# Display
# export DISPLAY=$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0
