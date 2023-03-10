#!/bin/bash
source make_log.sh
source if_exists.sh
function Search(){ 
read -p "Enter record name to serach in DB: " record_name
if if_exists $record_name;then
	echo $(cat "recordFileName.txt" | awk -F"," '{print $1}' | grep "$record_name" | sort)
	make_log ${FUNCNAME[0]} 0 #0 for Success
else
	echo "Record Doesnt Exists"
	make_log ${FUNCNAME[0]} 1 #0 for Failure
fi
}

