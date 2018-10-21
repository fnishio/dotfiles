###
### .bashrc
###

umask 022

# MANPATH (no need to set MANPATH)
unset MANPATH
export PATH=/opt/local/bin:${PATH}

# language (should be UTF-8)
export LANG=ja_JP.UTF-8

# *should not set DYLD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=/usr/local/lib:${DYLD_LIBRARY_PATH}

# env. variables
export DISPLAY=:0.0
#export XMODIFIERS="@im=kinput2.macim"
export EDITOR=/usr/bin/vi
export PAGER=less

# java
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

# ant
#PATH=${PATH}:/usr/local/ant/bin
#export ANT_HOME=/usr/local/ant

# mysql
PATH=${PATH}:/usr/local/mysql/bin

###
### interactive shell
###
if [ "$PS1" ]; then
    # Shell Variables
    PS1='\u@\h[\!]\$ '
    FIGNORE='~:.o:.out:.aux:.log'
    HISTSIZE=100

# bash on MacOSX
    set convert-meta off
    set meta-flag on
    set output-meta on

# other
    set -o ignoreeof
    set -o noclobber
    #
    stty erase ^H
    # alias
    alias	ls='ls -vF'
    alias	le=less
    alias	rm='rm -i'
    alias	clean='/bin/rm *~ .*~'
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nishio/.sdkman"
[[ -s "/home/nishio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nishio/.sdkman/bin/sdkman-init.sh"
