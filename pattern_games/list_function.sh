#! /bin/bash

function get_list_of_function () {
  local SCRIPT_NAME=$1
  cat $SCRIPT_NAME | grep function | cut -w -f2
}

get_list_of_function $1




