#!/bin/bash

function Print_Sorted () {
    # Read the lines of the input file into an array
    readarray -t records  < ${1:-"recordFileName.txt"}

    # Remove the header line if it exists
    if [[ "${records[0],,}" =~ record_name ]]; then
        records=("${records[@]:1}")
    fi

    # Check if the file is empty
    if [[ "${#records[@]}" -le 1 ]]; then
        echo "Your list is empty"
        echo "$(date +%d/%m/%Y\ %H:%M:%S) PrintAll RECORD Your list is empty"  >> recordFileName_log
    fi

    # Sort the lines by the first field (i.e., the name)
    # first field (column) specified with the -k1,1 option
    # using the comma (,) as the field separator specified with the -t',' option
    sorted_records=$(printf "%s\n" "${records[@]}" | sort -t',' -k1,1)

    # Print the sorted output with the associated numbers
    printf "%s\n" "${sorted_records[@]}"
    # to print to the log with date
    for record in "${sorted_records[@]}"; do
        printf '%s PrintAll RECORD_%s AMOUNT %s\n' "$(date '+%d/%m/%Y %H:%M:%S')" "${record%%,*}" "${record#*,}" | sed -e 's#,# AMOUNT #g' -e "s#^#$(date '+%d/%m/%Y %H:%M:%S') PrintAll RECORD_#" | sed 's#PrintAll RECORD_10/03/2023 10:32:58 #PrintAll RECORD_#g' >> recordFileName_log
done
}

Print_Sorted

