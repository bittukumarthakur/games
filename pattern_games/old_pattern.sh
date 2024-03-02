#! /bin/bash 

function tile() {
  TILE_NO=$1

  if [ $TILE_NO -eq 1 ];then
    echo -n " \\"
  else
    echo -n "/ "
  fi

}

function random() {
  jot -r 1 1 2
}

function horizontal_line() {
  NUMBER=0
  while [ $NUMBER -lt 20 ];do
    NUMBER=$(dc -e "$NUMBER 1 + p") 
    tile $(random)
  done
}

function two_row() {
  FIRST_LINE=$(horizontal_line)
  echo "$FIRST_LINE"
  echo "$FIRST_LINE" | sed "s/\(.\)\(.\)/\2\1/g"
}

function display_tile() {
  NUMBER=0
  while [ $NUMBER -lt 10 ];do
    NUMBER=$(dc -e "$NUMBER 1 + p") 
    two_row
  done
}

display_tile
