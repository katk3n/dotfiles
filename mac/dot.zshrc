export PATH=$HOME/bin:$HOME/.nodebrew/current/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

eval "$(starship init zsh)"

# alias
alias ls='ls -FG'
alias ll='ls -al'

setopt no_beep

# history
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt share_history

# enable completion after "=" (e.g. --prefix=/usr)
setopt magic_equal_subst

# add "/" when matched to directory in commandline expansion
setopt mark_dirs
