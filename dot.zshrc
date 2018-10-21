# -*- mode: sh; coding: utf-8 -*-
# .zshrc - set options for interactive shell

### functions
# calculator (from www.commandlinefu.com)
calc(){ awk "BEGIN{ print $* }" ;}

### options
setopt all_export

# Zle (emacs key bind)
bindkey -e

# Directory
setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups
setopt pushd_to_home
setopt noautoremoveslash
cdpath=(~)

# Completion
autoload -U compinit
compinit
FIGNORE='~:.o:.out:.aux:.log'
setopt list_packed
setopt nolistbeep
setopt magic_equal_subst
setopt auto_param_slash

# Expansion and Globbing
setopt extended_glob
setopt mark_dirs

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt bang_hist
setopt no_hist_beep
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt no_flow_control

# Input/Output
setopt no_clobber
setopt ignore_eof

# Job Control
setopt check_jobs

# Prompt
autoload -Uz add-zsh-hook
setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt

autoload -U colors
colors

set_rps1() {
  local cur_dir
  cur_dir=${PWD/#${HOME}/\~}
  if [ ${#cur_dir} -gt 30 ]; then
    cur_dir=${cur_dir[1,12]}...${cur_dir[${#cur_dir}-15,${#cur_dir}]};
  fi
  RPS1="(${cur_dir})"
}

set_title() {
  case "${TERM}" in
    xterm* )
      echo -ne "\033]0;${USER}@${HOST%%.*}${WINDOW:+":$WINDOW"}\007"
      ;;
    screen )
      echo -ne "\033P\033]0;${USER}@${HOST%%.*}${WINDOW:+":$WINDOW"}\007\033\\"
      ;;
    * )
      ;;
  esac
}

PS1="%n@%m${WINDOW:+":$WINDOW"}\$ "
add-zsh-hook precmd set_rps1
add-zsh-hook precmd set_title

### Aliases
alias	ls='ls -vF'
alias	rm='rm -i'
alias	clean='/bin/rm .*~ *~'

# suffix aliases
alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s gz=gzcat
alias -s tbz=bzcat
alias -s bz2=bzcat
alias -s java=lv
alias -s c=lv
alias -s C=lv
alias -s h=lv
alias -s cpp=lv
alias -s txt=lv
alias -s xml=lv

# docker
alias	docker_stop='docker ps -aq|xargs docker stop'
alias	docker_rm='docker ps -aq|xargs docker rm'

### OS Type
case ${OSTYPE} in
  darwin*)
    [ -f ~/.zshrc.darwin ] && source ~/.zshrc.darwin
    ;;
  linux*)
    [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
    ;;
esac

# start & attach screen session
#if [ ${TERM} != 'screen' ]; then
#  exec screen -d -R
#fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nishio/.sdkman"
[[ -s "/home/nishio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nishio/.sdkman/bin/sdkman-init.sh"
