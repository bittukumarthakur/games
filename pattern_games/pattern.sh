#! /bin/bash

# make pattern like this 
# \/ / / /  \ \ \
# \  / / / /\ \ \ 
# /  \ \/ / /  \ \
# /\ \  / / /\ \ 
# /  \/ / /  \ \ \
# /\  / / /\ \ \ 
# / / /  \ \/  \ \
# / / /\ \  /\ \ 

# small tile
# \/ 
#\  /

function tiles() { 
  local TILE_NUMBER=$1
  local TILE_1="/ \n /"
  local TILE_2=" \\\\\n\ "
  if [ $TILE_NUMBER = 1 ];then
    echo -e "$TILE_1"
  else
    echo -e "$TILE_2"
  fi
}


function random_number () {
  jot -r 1 1 2
}


function row_tiles () {

  local NUMBER_OF_TILES_IN_ROWS=$1
  local COUNTER=0
  local UPPER_PORTION
  local LOWER_PORTION

  for count in $(seq 1 $NUMBER_OF_TILES_IN_ROWS);
  do
    local TILE_NUMBER=$(random_number)
    local CURRENT_TILE=$(tiles $TILE_NUMBER)
    UPPER_PORTION="$UPPER_PORTION$( echo "$CURRENT_TILE" | head -n1)"
    LOWER_PORTION="$LOWER_PORTION$( echo "$CURRENT_TILE" | tail -n1)"
  done
  echo "$UPPER_PORTION"
  echo "$LOWER_PORTION"
}

function generate_tiles_pattern () {

  local NUMBER_OF_TILES_IN_ROWS=$1
  local NUMBER_OF_TILES_IN_COLUMNS=$2
  local COUNTER

  for COUNTER in $(seq 1 $NUMBER_OF_TILES_IN_COLUMNS);
  do

    COUNTER=$(dc -e "$COUNTER 1 + p")
    row_tiles $NUMBER_OF_TILES_IN_ROWS
  done
}

generate_tiles_pattern 20 10

