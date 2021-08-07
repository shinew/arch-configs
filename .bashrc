# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -haltr'
alias htopu='htop --user=shine'
alias gpush='git add . && git commit -a -m "z" && git push'
alias update-arch-packages='sudo pacman -Syu'
alias start-vpn='sudo eddie-ui'

function update-emacs {
  local CWD=$(pwd)
  cd ~/.emacs.d
  git pull
  emacs --batch -l ~/.emacs.d/init.el --eval="(configuration-layer/update-packages t)"
  cd "$CWD"
}

function update-rust {
  rustup update
}

function update-all {
  update-arch-packages
  update-emacs
  update-rust
}

# Setup PS1
BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"
PS1="[\u@\h ${BLUE}\w${RESET}]\n\$ "

# Set vi edit mode
set -o vi

# Prefer vim editor
export EDITOR=/usr/bin/vim

# Print last command exit status if non-zero
function display-exit-status {
  local status=$?
  if (( status != 0 )); then
    echo "$(tput setaf 1)EXIT STATUS $status$(tput sgr 0)"
  fi
}
PROMPT_COMMAND=display-exit-status

# Set infinite bash history
HISTSIZE=
HISTFILESIZE=

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH" 
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"
