#! /bin/bash
source make_log.sh
source if_exists.sh
source help_1_func.sh

read -p "Enter Which Record: " record amount
#delete record
function Delete_Record(){
#Checks if the correct parameters have been entered
if ! [[ $record == null || $amount -eq 0 ]]
then
#Checks if the record exists
    if if_exists $record 
    then
        selection=$(get_menu $record) #Shows all the same deletion options
        echo "$(grep -vw "$record" recordFileName.txt)" > recordFileName.txt #Deletion operation by selection from the list
        echo "$selection record deleted"
        number=$( cat "recordFileName.txt" | grep -w "$selection" | awk -F"," '{print $2}' | sort --unique )
        let amount=$amount-$number
        sed -i "s/^$selection,.*/$selection,$amount/g" recordFileName.txt
        make_log ${FUNCNAME[0]} 0
    else
        echo "$record record not deleted"
        make_log ${FUNCNAME[0]} 1
    fi
else 
    echo "enter the parameters"
fi
}

