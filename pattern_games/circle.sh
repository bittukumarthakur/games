#! /bin/bash


# Aim to make a circle 
# start with square 

# radius=5
# center=0,0
# square root of (x2-x1)^2 + (y2-y1)^2 = distance(r)

# sample square output
####
####

function square () {
  local BASE=$1
  local POWER=2
  echo "$BASE ^ $POWER" | bc
}

function distance_between_two_points () {
  local X1=$1; local Y1=$2
  local X2=$3; local Y2=$4
  local DIFFERENCE_OF_ABSCISSA=$(echo "$X2 - $X1" | bc)
  local DIFFERENCE_OF_ORDINATE=$(echo "$Y2 - $Y1" | bc)

  dc -e "$(square $DIFFERENCE_OF_ABSCISSA) $(square $DIFFERENCE_OF_ORDINATE) + v p"
}

function display_circle () {
  local RADIUS=$1

  for ORDINATE in  $(seq -$RADIUS $RADIUS)  
  do 
    local ROW=""

    for ABSCISSA in $(seq -$RADIUS $RADIUS)
    do
      local DISTANCE=$(distance_between_two_points $ABSCISSA $ORDINATE 0 0)
      local CURRENT_PIXEL="  "

      if [ $DISTANCE -le $RADIUS ];then 
        CURRENT_PIXEL="**"
      fi
      ROW=$ROW$(echo -n "$CURRENT_PIXEL")
    done
    echo -e "$ROW"
  done
}

display_circle $1


