#!/bin/bash

function if_exists(){
declare file="recordFileName.txt"
declare regex="$1"

declare file_content=$( cat "${file}" )
if [[ " $file_content " =~ $regex ]] # please note the space before and after the file content
    then
        return 0
    else
        return 1
fi



}

