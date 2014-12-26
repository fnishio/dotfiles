###
### .zshrc
###    - set various options for interactive shell
###

###
### functions
###
set_rps1() {
  DIR=`pwd|sed -e "s|$HOME|~|"`
  if [ ${#DIR} -gt 30 ]; then
    CurDir=${DIR[1,12]}...${DIR[${#DIR}-15,${#DIR}]};
  else
    CurDir=$DIR;
  fi
  RPS1="(${CurDir})"
}

# calculator (from www.commandlinefu.com)
calc(){ awk "BEGIN{ print $* }" ;}

###
### Options & Parameters
###

# Zle (emacs key bind)
bindkey -e

# Changing Directories
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home
setopt noautoremoveslash

# Completion
autoload -U compinit
compinit
FIGNORE='~:.o:.out:.aux:.log'
setopt list_packed
setopt nolistbeep

# Expansion and Globbing
#setopt extended_glob

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt bang_hist
setopt no_hist_beep
setopt share_history
setopt hist_ignore_dups

# Initialization
# setopt all_export

# Input/Output
setopt no_clobber
setopt ignore_eof

# Job Control
setopt check_jobs

# Prompting
PS1="%n@%m${WINDOW:+":$WINDOW"}\$ "
#RPS1="(%~)"
case "${TERM}" in
  xterm* )
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}${WINDOW:+":$WINDOW"}\007"
      set_rps1
    }
    ;;
  screen )
    precmd() {
      echo -ne "\033P\033]0;${USER}@${HOST%%.*}${WINDOW:+":$WINDOW"}\007\033\\"
      set_rps1
    }
    ;;
  * )
    precmd() {
      set_rps1
    }
    ;;
esac


###
### Aliases
###
alias	ls='ls -vF'
alias	rm='rm -i'
alias	clean='/bin/rm .*~ *~'
alias	ubuntu='ssh -X ubuntu'
alias	minicom='LANG=C sudo minicom'
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
alias -s sh=lv
alias -s txt=lv
alias -s xml=lv
#alias -s html=firefox
#alias -s xhtml=firefox
#alias -s gif=display
#alias -s jpg=display
#alias -s jpeg=display
#alias -s png=display
#alias -s bmp=display

# start & attach screen session
#if [ ${TERM} != 'screen' ]; then
#  exec screen -d -R
#fi
