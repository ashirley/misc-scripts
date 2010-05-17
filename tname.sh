#!/bin/bash

#from http://gist.github.com/31631
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\][\t]: \[\033[01;34m\]\w\[\033[00m\] \[\033[01;33m\]$(parse_git_branch)\[\033[00m\] \$ '

if [ $# -gt 0 ]
then
  echo -ne "\033]0;$@\007"
else
  PS1="$PS1\[\033]0;\W: \u@\h: \w\007\]"
fi
