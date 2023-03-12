#! /bin/bash
source make_log.sh
source if_exists.sh
source help_1_func.sh
source Search.sh
source update.sh

read -p "Enter New Record: " record amount
# add record
Add_Record(){
if ! [[ $record == null || $amount -eq 0 ]]
then
    if ! if_exists $record;
    then
        echo $record,$amount >> recordFileName.txt
        echo "new record enterd"
        make_log ${FUNCNAME[0]} 0
    else
        echo "you allready have this record"
        make_log ${FUNCNAME[0]} 1
        echo "If none of the selections matches your request please choose Quit to add to the directory"
        selection=$(get_menu $record) 
        if [[ $selection == "exit" ]]
        then
            echo $record,$amount >> recordFileName.txt
        fi
        number=$( cat "recordFileName.txt" | grep -w "$selection" | awk -F"," '{print $2}' | sort --unique )
        let amount=$number+$amount
        sed -i "s/^$selection,.*/$selection,$amount/g" recordFileName.txt
        make_log ${FUNCNAME[0]} 0
    fi
else 
    echo "enter the parameters"
    make_log ${FUNCNAME[0]} 1
fi
}
Add_Record



