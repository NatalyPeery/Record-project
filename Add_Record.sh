#! /bin/bash

source if_exists.sh
source help_1_func.sh
source Search.sh
source update.sh

read -p "Enter New Record: " record amount
# isInFile=$(cat recordFileName.txt | grep -c "$record")
# add record
Add_Record(){
if ! if_exists $record;
then
    echo $record,$amount >> recordFileName.txt
    echo "new record enterd"
else
    if [[ $2 -eq 0 ]]
    then
    Search $record
    echo "you allready have this record"
    update_name $record
    # selection=$(get_menu $record) 
    # let amount=$amount+1
	# echo $selection"_"$new_name,$amount >> recordFileName.txt
    fi
fi
}
Add_Record


