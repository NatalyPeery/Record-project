#!/bin/bash
source make_log.sh
function Search(){ 
read -p "Enter record name to serach in DB: " record_name
echo $(cat "recordFileName.txt" | awk -F"," '{print $1}' | grep "$record_name" | sort)
make_log ${FUNCNAME[0]} 0 #0 for Success
}

