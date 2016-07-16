# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source /opt/ros/indigo/setup.bash
source ~/catkin_ws/devel/setup.bash
alias ws="cd ~/catkin_ws"
alias bash="vim ~/.bashrc"
alias ipscan="nmap -sP 192.168.1.0/24"
alias ipscan2='nmap -sP 10.42.0.0/24'
alias pingmanifold="ping 192.168.1.125"
alias conmanifold="ssh -X ubuntu@192.168.1.125"
alias conmanifold2="ssh -X ubuntu@192.168.1.124"
alias install="sudo apt-get install"
alias catkin_makehere="cd ~/catkin_ws; catkin_make; cd -"
alias pinggoogle="ping www.google.com"
alias matlab="cd /usr/local/MATLAB/R2014b/bin/ ; ./matlab ;cd -"
alias soucatkinbd="source ~/catkin_bd/devel/setup.bash"
alias sou="source ~/.bashrc"
alias rm="trash"
alias poweroff="sudo poweroff"
alias vins="subl ~/catkin_ws/src/catkin_ws.sublime-workspace"
alias visionworks="subl ~/VisionWorks-1.0-Samples/demos/feature_tracker/project.sublime-project"
alias biu="scp VisionWorks-1.0-Samples/demos/feature_tracker/main_feature_tracker.cpp ubuntu@192.168.1.125:~/catkin_ws/src/visionworks/src/ ; "
alias catkinbuild="reset;cd ~/catkin_ws;catkin build;cd -"
alias LS="ls"
alias cpu="cat /proc/cpuinfo |grep MHz"
alias rosclean='rm -rf /home/tony-pc/.ros/log'
alias desktop='rdesktop 143.89.131.252 -g 1024x800 -d hkust -u tqinab -p HaHa3344'
alias matlab='cd /usr/local/MATLAB/R2014b/bin; ./matlab'
alias connuc='ssh -X uav@192.168.1.130'
alias remotenuc='export ROS_MASTER_URI=http://10.42.0.93:11311'
#alias remote='export ROS_MASTER_URI=http://10.42.0.93:11311'
alias gitdebug='git add .;git commit -m "fix small debugs";git push origin master'
alias remote='export ROS_MASTER_URI=http://192.168.1.125:11311'
alias remote2='export ROS_MASTER_URI=http://192.168.1.124:11311'


alias cpumax="sudo cpupower frequency-set -g performance"
alias cpufreq="cpufreq-info"

