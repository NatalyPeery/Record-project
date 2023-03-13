
#!/bin/bash
#---------------------------------------------------------------------------calll functions-------------------------------------------------------------------------------------------
source if_exists.sh
source help_1_func.sh
source make_log.sh

#---------------------------------------------------------------------------update the amount of the alment --------------------------------------------------------------------------
function update_amount() {
    read -p "Which record's amount you would like to change? " rec_name
    if if_exists $rec_name; then
        selection=$(get_menu $rec_name)
        read -p "Enter new amount: " new_amount
        sed -i "s/^$selection,.*/$selection,$new_amount/g" recordFileName.txt
        make_log ${FUNCNAME[0]} 0 # 0 for Success
    else
        echo "There are no records named $rec_name left"
        make_log ${FUNCNAME[0]} 1 # 1 for Failure
    fi
}
