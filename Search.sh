#!/bin/bash
function Search(){ 
read -p "Enter record name to serach in DB: " record_name
echo $(cat "recordFileName.txt" | awk -F"," '{print $1}' | grep -i "$record_name" | sort)
}
