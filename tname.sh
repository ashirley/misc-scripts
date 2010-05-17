#!/bin/bash

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\][\t]: \[\033[01;34m\]\w\[\033[00m\] \$ '


if [ $# -gt 0 ]
then
  echo -ne "\033]0;$@\007"
else
  PS1="$PS1\[\033]0;\W: \u@\h: \w\007\]"
fi
