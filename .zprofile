###
### .zprofile
### 	- environment variable(s)
###

# language (should be UTF-8)
#export LANG=ja_JP.UTF-8
#export XMODIFIERS="@im=kinput2.macim"

# X local display
export DISPLAY=:0.0

# Editor
export EDITOR=/usr/bin/vi
export PAGER=lv

# java
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

# devkit PRO
#export DEVKITPRO=/opt/local/devkitPro

###
### PATH
###

# mac port path
PATH=/opt/local/bin:${PATH}

# Code Sourcery
#PATH=${PATH}:/opt/codesourcery/bin

# ant
#PATH=${PATH}:/usr/local/ant/bin
#export ANT_HOME=/usr/local/ant

# mysql
#PATH=${PATH}:/usr/local/mysql/bin

# devkit PRO
#PATH=${PATH}:/opt/local/devkitPro/devkitARM/bin

# android emulator & tools
export PATH=${PATH}:~/Library/Android/sdk/tools

# work around for Android Studio 1.0
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk
alias studio='open /Applications/Android\ Studio.app'

export PATH

###
### EOF
###
