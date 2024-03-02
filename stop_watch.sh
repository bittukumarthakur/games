#! /bin/bash

function stop_watch() {

  OPTION=$1

  if [ $OPTION = s ]; then 
  date "+%M"
  fi

}

stop_watch
