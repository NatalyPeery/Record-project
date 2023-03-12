
#!/bin/bash
source if_exists.sh
source help_1_func.sh
source make_log.sh
function update_amount(){
	read -p "Which record would you like to update the amount for? " rec_name
	if if_exists $rec_name; then
		selection=$(get_menu $rec_name)
		read -p "Enter the new amount: " new_amount
		awk -v name="$selection" -v amount="$new_amount" '$1 == name { $3 = amount; print "Updated amount:", $3 } 1' recordFileName.txt > tmp.txt && mv tmp.txt recordFileName.txt
		make_log ${FUNCNAME[0]} 0 # 0 for Success
	else
		echo "There are no records named $rec_name"
		make_log ${FUNCNAME[0]} 1 # 1 for Failure
	fi
}

