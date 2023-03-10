#!/bin/bash
function get_menu(){

file_search_name=$1
options=( $( cat "recordFileName.txt" | awk -F"," '{print $1}' | grep "$file_search_name") )
select opt in "${options[@]}" "Quit" ; do
  if (( REPLY == 1 + "${#options[@]}" )) ; then
    exit

  elif (( REPLY > 0 && REPLY <= "${#options[@]}" )) ; then
    echo  "You picked $opt"
    break

  else
    echo "Invalid option. Try another one."
  fi
done
}
