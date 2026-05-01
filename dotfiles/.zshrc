# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=40000
SAVEHIST=40000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#
zstyle :compinstall filename '/home/xian/.zshrc'
export EDITOR=/usr/bin/vim

autoload -Uz compinit
compinit
# End of lines added by compinstall

#########################################
# xian config
########################################
#
#
export PGDATABASE=covid
## one ssh-agent shared across shells 
## https://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-a-password-prompt
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

## add rustup
export PATH=$PATH:~/bin:~/admin/bin:$HOME/.cargo/bin
## bob/nvim
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin 
## flatpak bins
#export PATH=$PATH:~/.local/share/flatpak/exports/bin
# shell/cli related
alias ipy='ipython --TerminalInteractiveShell.editing_mode=vi'
alias disp='export DISPLAY=:0.0'
alias ls='ls -hF --color=tty'                 # classify files in colour
alias lls='ls -alh'                 
alias lsh='ls -alh . | head'                 
alias lsw='ls -alh . | wc'                 
## other double-letter customs
alias ddf='df -kh'
alias ddu='du -sh'
alias RR='R --no-restore-data --no-save'
alias vi='vim'
alias grep='grep --color -n'
alias rvn='R --no-restore-data'
alias rvn_clean='R --vanilla'
## zsh key bindings
bindkey '^R' history-incremental-search-backward
## my bin
#export PATH=$PATH:~/bin:~/src/gocode/bin
export PAGER=less
export LESS="-iMSx4 -FX"
export BUILDDIR=~/build
## psql
# 

## programs
## cleanup routes after vpn connect: more effort than its worth?
##
# alias my.route.fix="sudo route add default gw 192.168.1.1 dev br0"

alias my.iftop='sudo iftop -c ~xian/.iftoprc -n -i wlp61s0'
## prompt
autoload -U promptinit
promptinit

autoload -U colors && colors
##
#PS1="%{$fg[blue]%}%l %T %n@%m:%{$reset_color%}%{$fg[green]%}%~$%{$reset_color%}" # history.24Htime-user@host:workingdir$
PROMPT='%F{magenta}%D{%m.%d}%f %F{cyan}%T% %m:%f% %F{blue}%~$' 


#########################################
# end xian config
#########################################

## mamba install: 
# https://github.com/conda-forge/miniforge
# curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
# sh ./Miniforge[...].sh
####
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/xian/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/xian/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
