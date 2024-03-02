#! /bin/bash

# Aim: to generate math-expression and check the result that is given by user.

# Example: 
# Evaluate the expression: 5 + 6 = 11 -> correct
# Evaluate the expression: 4 + 2 = 7 -> wrong. Answer should be 6.

# Number-of-questions
# Total-score
# Time-taken

function generate_random_number() {
  jot -r 1 $1 $2 
}

function generate_random_operator() {
  echo -e "+\n-\n*\n/" | sort -R | head -n1
}

function generate_expression() {
  local UPPER_LIMIT=$1
  local LOWER_LIMIT=$2
  local FIRST_TERM=$(generate_random_number $UPPER_LIMIT $LOWER_LIMIT)
  local OPERATOR=$(generate_random_operator)
  local SECOND_TERM=$(generate_random_number $UPPER_LIMIT $LOWER_LIMIT)

  echo "$FIRST_TERM $OPERATOR $SECOND_TERM"
}

function is_right() {
  local EXPECTED=$1
  local ACTUAL=$2
  [ $EXPECTED -eq $ACTUAL ]
}

function add_score() {
  local TOTAL_SCORE=$1
  local CURRENT_SCORE=$2
  dc -e "$CURRENT_SCORE $TOTAL_SCORE + p"
}

function actual_answer() {
  local EXPRESSION=$1
  echo "$EXPRESSION" | bc
}

function math_quiz() {
  local TOTAL_QUESTION=$1
  local QUESTION_NUMBER=0
  local TOTAL_SCORE=0
  echo "Total-Questions:$TOTAL_QUESTION"

  while [ $QUESTION_NUMBER -lt $TOTAL_QUESTION ]; do
    QUESTION_NUMBER=$(dc -e "$QUESTION_NUMBER 1 + p")

    local EXPRESSION=$(generate_expression 1 10)
    local ACTUAL=$(actual_answer "$EXPRESSION")
    read -p "$Question:$QUESTION_NUMBER => $EXPRESSION = " EXPECTED

    if is_right "$EXPECTED" "$ACTUAL"; then 
      TOTAL_SCORE=$(add_score $TOTAL_SCORE 1)
    else 
      echo "wrong. Answer should be $ACTUAL "
    fi
  done
  echo "Your score:$TOTAL_SCORE/$TOTAL_QUESTION"
}

function main() {
  math_quiz 3
}

main

