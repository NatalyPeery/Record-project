#!/bin/bash
source make_log.sh
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
        make_log ${FUNCNAME[0]} 1
	else

    # Sort the lines by the first field (i.e., the name)
    # first field (column) specified with the -k1,1 option
    # using the comma (,) as the field separator specified with the -t',' option
    sorted_records=$(printf "%s\n" "${records[@]}" | sort -t',' -k1,1)

    # Print the sorted output with the associated numbers
    printf "%s\n" "${sorted_records[@]}"
    # to print to the log with date
    make_log ${FUNCNAME[0]} 0
    fi
}


