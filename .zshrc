# Load paths
if [ -e $HOME/.config_shell/.sh_paths ]; then
    source $HOME/.config_shell/.sh_paths
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Load aliases
if [ -e $HOME/.config_shell/.sh_aliases ]; then
    source $HOME/.config_shell/.sh_aliases
fi

# Load functions
if [ -e $HOME/.config_shell/.sh_functions ]; then
    source $HOME/.config_shell/.sh_functions
fi

# Load keyboard fix
if [ -e $HOME/.config_shell/.sh_key_hooks ]; then
    source $HOME/.config_shell/.sh_key_hooks
fi

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
