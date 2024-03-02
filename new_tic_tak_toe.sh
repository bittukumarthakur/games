#! /bin/bash

# Aim: tic-tak-toe game

# pattern
# 1 2 3 
# 4 5 6
# 7 8 9

#display pattern 
#mark position with symbole


PATTERN="1 2 3\n4 5 6\n7 8 9"

function display_pattern() {
  echo -e $PATTERN 
}

function is_right_move() {

  local MOVE=$1
  if  [ 0$(display_pattern | grep -o "$MOVE") -eq "$MOVE" ] ;then
    clear
    return 0
  else
    return 1
  fi

}

function mark_position() {
  local POSITION=$1
  local SYMBOLE=$2
  is_right_move $POSITION
  if [ $? -eq 0 ];then  
    PATTERN=$(echo $PATTERN | tr "$POSITION" "$SYMBOLE")
  else
    clear
    echo "position is already marked"
  fi

}

function is_pattern_match() { 
  local CURRENT_PATTERN=$1
  if [ "$CURRENT_PATTERN" = "ooo" ];then
    echo  Player o win
    exit 
  fi

  if [ "$CURRENT_PATTERN" = "xxx" ];then
    echo Player x win
    exit
  fi

}

function match_rows() {

  for ROW_NUMBER in 1 2 3; do
    local CURRENT_ROW=$(display_pattern | head -n$ROW_NUMBER | tail -n1 | tr -d " ")
    is_pattern_match $CURRENT_ROW
  done
}

function match_columns() {

  for COLOUM_NUMBER in 1 2 3; do
    local CURRENT_COLUMN=$(display_pattern | cut -w -f$COLOUM_NUMBER | tr -d "\n")
    is_pattern_match $CURRENT_COLUMN
  done
}

function match_first_diagonal() {

  for DIAGONAL_UNIT in 1 2 3; do
    local DIAGONAL=$(echo $DIAGONAL$(display_pattern | head -n$DIAGONAL_UNIT | tail -n1 | cut -w -f$DIAGONAL_UNIT))
  done
  is_pattern_match $DIAGONAL
}


function match_second_diagonal() {

  for DIAGONAL_ROW_UNIT in 1 2 3; do
    local DIAGONAL=$(echo $DIAGONAL$(display_pattern | head -n$DIAGONAL_ROW_UNIT | tail -n1 | cut -w -f$(dc -e "4 $DIAGONAL_ROW_UNIT - p"  ) ))
  done
  is_pattern_match $DIAGONAL
}

function is_win() {
  match_rows
  match_columns
  match_first_diagonal
  match_second_diagonal

}

function main() {
  display_pattern

  read -p "o player chance: "  POSITION 
  mark_position $POSITION o
  display_pattern
  is_win

  read -p "x player chance: " POSITION 
  mark_position $POSITION x
  display_pattern
  is_win 

  read -p "o player chance: "  POSITION 
  mark_position $POSITION o
  display_pattern
  is_win

  read -p "x player chance: " POSITION 
  mark_position $POSITION x
  display_pattern
  is_win 

  read -p "o player chance: "  POSITION 
  mark_position $POSITION o
  display_pattern
  is_win

  read -p "x player chance: " POSITION 
  mark_position $POSITION x
  display_pattern
  is_win 
  read -p "o player chance: "  POSITION 
  mark_position $POSITION o
  display_pattern
  is_win

  read -p "x player chance: " POSITION 
  mark_position $POSITION x
  display_pattern
  is_win 
  read -p "o player chance: "  POSITION 
  mark_position $POSITION o
  display_pattern
  is_win

  read -p "x player chance: " POSITION 
  mark_position $POSITION x
  display_pattern
  is_win 
}

main
