export TERM=xterm-256color
setopt no_beep

# Set up the prompt
autoload -Uz promptinit
promptinit

autoload colors
colors
BASE_PROMPT="%{${fg[green]}%}%(!.#.>) %{${reset_color}%}"
INFO_PROMPT="%{${fg[magenta]}%}[%n@%m] %~%{${reset_color}%}"
PROMPT=$'\n'"$INFO_PROMPT"$'\n'"$BASE_PROMPT"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

function accept_line() {
  if [[ ${#PROMPT} -ne ${#BASE_PROMPT} ]]; then
    local saved_prompt=$PROMPT
    PROMPT=$BASE_PROMPT
    zle reset-prompt
    PROMPT=$saved_prompt
  fi
  zle accept-line
}
zle -N accept_line
bindkey '^M' accept_line

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# alias
alias ls='ls --color'
alias ll='ls -al'

# ls
function chpwd() { ls }

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# keychain
if [ -e $HOME/.keychain/$HOST-sh ]; then
  source $HOME/.keychain/$HOST-sh
else
  echo 'keychain is not set up. please set up keychain by:'
  echo '> /usr/bin/keychain -q --nogui <path/to/private_key>'
  echo '> source $HOME/.keychain/$HOST-sh'
fi