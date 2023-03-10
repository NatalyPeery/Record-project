#!/bin/bash
function make_log(){
func_name=$1
if [[ $2 -eq 0 ]];then
	log="$(date +"%D %T" ) "$1" Succsses"
else
	log="$(date +"%D %T" ) "$1" Failed"
fi
echo "$log"
echo "$log" >> recordFileName_log
}

