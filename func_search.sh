#!/bin/bash
read -p "Enter record name to serach in DB: " record_name
echo $(cat "reshooma.txt" | awk -F"," '{print $1}' | grep -i "$record_name" | sort)
