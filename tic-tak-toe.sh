#! /bin/zsh

# Aim: to make  game like tic-tak-toe
# format:
# 1 2 3
# 4 5 6
# 7 8 9


echo "1 2 3
4 5 6
7 8 9" > pattern

# x_match_file
echo "x x x" > x_file

# o_match_file
echo "o o o" > o_file

# It mark x
function mark() {
input=$1
  SYMBOL_MARK=$2
cat pattern | sed "s/$input/$SYMBOL_MARK/" | tee pattern | cat 
}


# It mark o
#function mark_o() {
#input=$1
#cat pattern | sed "s/$input/o/" | tee pattern | cat 
#}

# chech_match
 
function match_row() {

 local FILE_NAME=$1
 local SYMBOL=$2
for ROW_NUMBER in 1 2 3;do  
head -$ROW_NUMBER pattern | tail -n1 > x_current_file
diff $FILE_NAME x_current_file > /dev/null
 if [ $? -eq 0 ]; then
   echo "$SYMBOL player win"
   exit
 fi
done
}


function match_coloum() {

 local FILE_NAME=$1
 local SYMBOL=$2

 for COLOUM_NUMBER in 1 2 3;do  
cut -w -f$COLOUM_NUMBER pattern | tr "\n" " "    > x_current_file
diff -w $FILE_NAME x_current_file > /dev/null
 if [ $? -eq 0 ]; then
   echo "$symbol player win"
   exit
 fi
done
}

# match 


#main

cat pattern

for num in 1 2 3 4 5; do

  echo "x player chance"
read input
mark $input x

match_row x_file x
match_coloum x_file x
  
match_row o_file o
match_coloum o_file o
echo "o player chance"
read input
mark $input o


#match_coloum
match_row x_file x
match_coloum x_file x

match_row o_file o
match_coloum o_file o
done


