#! /bin/bash

echo "Please select your desired option"
options=("Add_Record" "Delete Record" "Search" "Update Name" "Update Amount" "Print Amount" "Print Sorted" "Exit")
COLUMNS=1
select i in "${options[@]}" ; do
case $i in
"Add_Record" Add_Record ;;
"Delete Record" Delete_Record ;;
"Search" Search ;;
"Update Name" Update_Name ;;
"Update Amount" Update_Amount ;;
"Print Amount" Print_Amount
"Print Sorted" Print_Sorted ;;
"Exit") exit ;;
*) echo "Invalid option please try again" ;;
esac
done 