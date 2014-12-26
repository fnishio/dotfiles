#
# .bash_profile
#

[ -f ~/.bashrc ] && . ~/.bashrc

# start X (for *BSD)
#if [ "`tty`" = "/dev/ttyv0" ]; then
#  echo "Start X window after 3 sec. ^C to console."
#  sleep 3
#  startx -- -bpp 32
#fi

# MacPorts Installer addition on 2011-08-16_at_01:21:55: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

