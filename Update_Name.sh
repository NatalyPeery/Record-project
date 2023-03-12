#!/bin/bash
source if_exists.sh
source help_1_func.sh
source make_log.sh
function update_name(){
read -p "Which record you would like to change name? " rec_name
if if_exists $rec_name;then
	selection=$(get_menu $rec_name) 
	read -p "Enter new name: " new_name
	sed -i "s/\<$selection\>/$new_name/g" recordFileName.txt
	make_log ${FUNCNAME[0]} 0 #0 for Success
else
	echo "There are no records named $rec_name left"
	make_log ${FUNCNAME[0]} 1 #0 for Failure




fi

}
