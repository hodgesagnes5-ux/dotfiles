# .zshrc for zsh
# Basic setup: PATH, history, completion, vi mode, plugins

# Add local bin directories early in PATH
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Basic shell options
setopt autocd               # change to a dir by typing it
setopt appendhistory        # append to history, don't overwrite
setopt sharehistory         # share history between shells
setopt histignorealldups    # don't record duplicate entries
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# Completion
autoload -U compinit && compinit

# Vi keybindings
bindkey -v
export KEYTIMEOUT=1

# Prompt (starship recommended)
# Uncomment to use starship if installed
# eval "$(starship init zsh)"

# Enable color and nicer ls if available
if [ -x "$(command -v dircolors)" ]; then
  eval "$(dircolors -b)"
fi

# Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias ga='git add'
alias gc='git commit'

# Common functions
mkcd() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

# fzf integration if available
if [ -f "$(command -v fzf)" ] || [ -f "$HOME/.fzf/bin/fzf" ]; then
  # set up keybindings for fzf if plugin is available
  # requires fzf.tcl or fzf.zsh to be installed; see README
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

# zsh-autosuggestions and zsh-syntax-highlighting
if [ -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [ -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Git and path completions
if [ -f "/usr/share/zsh/site-functions/_git" ]; then
  fpath=(/usr/share/zsh/site-functions $fpath)
fi

# Load user's custom config if present
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# End of .zshrc
