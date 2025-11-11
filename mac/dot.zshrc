export PATH=$HOME/bin:$HOME/.nodebrew/current/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:$HOME/go/bin:$HOME/.local/bin:$PATH

setopt no_beep

# ----------------
# ls
# ----------------
alias ls='ls -FG'
alias ll='ls -al'
export LSCOLORS=gxfxcxdxbxegedabagacad
function chpwd() { ls }

# cd
setopt auto_pushd

# ----------------
# history
# ----------------
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_verify
setopt share_history
setopt append_history

# ----------------
# completion
# ----------------
autoload -U compinit; compinit

setopt auto_list
setopt no_list_types
setopt list_packed
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash

# add "/" when matched to directory in commandline expansion
setopt mark_dirs

# enable completion after "=" (e.g. --prefix=/usr)
setopt magic_equal_subst

zstyle ':completion:*' list-colors \
'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# case-insentive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# highlight completion candidates
zstyle ':completion:*' menu select=1

# multibyte support
setopt print_eight_bit

# disable C-s, C-q
setopt no_flow_control

# show lines without newline chars
unsetopt promptcr

# ----------------
# starship
# ----------------
eval "$(starship init zsh)"
source ${HOME}/.ghcup/env

