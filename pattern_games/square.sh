#! /bin/bash




a=0
while [ $a -lt 10 ];do
  a=$(dc -e "$a 1 + p")

  n=0
  while [ $n -lt 10 ]; do
    n=$(dc -e "$n 1 + p")
    pattern=""
    pattern="$pattern$(echo -n "*")"

  done
  echo $pattern
done
