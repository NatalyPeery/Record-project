#! /bin/bash

source make_log.sh

read -p "Enter Which Record: " record

#delete record
Delete_Record(){
if [[ $(< recordFileName.txt) != "$record" ]]
then
    # while IFS=" " read -r line
    # do
        if [[ $record == $line ]]
        then
            sed -i "/$record/d" recordFileName.txt
            echo "$record record deleted"
            make_log ${FUNCNAME[0]} 0
        else
            echo "$record record not deleted"
            make_log ${FUNCNAME[0]} 1
        fi
    # done < recordFileName.txt
# else
#     echo "$record record not deleted"
#     make_log ${FUNCNAME[0]} 1
fi
}
Delete_Record