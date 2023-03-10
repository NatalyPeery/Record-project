#! /bin/bash

#source Add_Record.sh
#source Delete_Record.sh
source Search.sh 
#source Update_Name.sh
#source Update_Amount.sh
source Print_Amount.sh
source Print_Sorted.sh

echo "Please select your desired option"
options=("Add_Record" "Delete Record" "Search" "Update Name" "Update Amount" "Print Amount" "Print Sorted" "Exit")
COLUMNS=1
select i in "${options[@]}" ; do
case $i in
"Add_Record") echo "Add";;
"Delete Record")  echo "Delete Record";;
"Search") Search ;;
"Update Name")  echo "Update Name";;
"Update Amount")  echo "Update Amount";;
"Print Amount") Print_Amount;;
"Print Sorted")  Print_Sorted ;;
"Exit") exit ;;
*) echo "Invalid option please try again" ;;
esac
done 
