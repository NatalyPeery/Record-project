#!/bin/bash

function Print_Amount () {
    # Read the lines of the input file into an array
    readarray -t records  < ${1:-"recordFileName.txt"}

    # Remove the header line if it exists
    if [[ "${records[0],,}" =~ record_name ]]; then
        records=("${records[@]:1}")
    fi

    # Check if the file is empty
    if [[ "${#records[@]}" -le 1 ]]; then
        echo "Your list is empty"
        #echo "$(date +%d/%m/%Y\ %H:%M:%S) PrintAll RECORD Your list is empty"  >> recordFileName_log
        make_log ${FUNCNAME[0]} 1
    else

    # add the numbers
    sum=0
    for element in "${records[@]}";do
            number=$(echo "$element" | cut -d',' -f2)
            sum=$((sum + number))
    done
    echo "the amount of records is: $sum"
    make_log ${FUNCNAME[0]} 0
    fi
}

