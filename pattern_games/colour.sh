#! /bin/bash

# colour output

#Code:
#30 - black
#31 - red
#32 - green
#33 - yellow
#34 - blue
#35 - magenta
#36 - cyan
#37 - white

function myecho () {
  local COLOUR=$1
  local TEXT=$2

  if [ $COLOUR = -b ]
  then
    echo -e "\033[34m$2\033[m"
  fi
}

function red () {
  echo -e "\033[31m$1\033[m"
}

function green () {
  echo -e "\033[32m$1\033[m"
}

function yellow () {
  echo -e "\033[33m$1\033[m"
}
myecho -b "hello this is blue"
red "This is red  "
green "This is green  "
yellow "This is yellow "
