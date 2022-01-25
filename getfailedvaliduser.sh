#! /bin/bash

#   Name: getfailedvaliduser.sh
#
#   Purpose: search through list of IP addresses
#            find the top ten where usernames are valid
#            output them to a .txt document
#            print out the usernames
#
#   Written By: William Van Leeuwen, January 2022
#   
#   Usage: ./getfailedvaliduser.sh [filename]

#clear the list if exists
if [[ -f top_10_target_names.txt ]]
then
    rm top_10_target_names.txt
fi


if [[ -z $1 ]];
then 
    echo -e "\nError!"
    echo -e "./getfailedvaliduser.sh [filepath]"
else
    #get offending usernames that are NOT invalid and sort/count them
    grep -ie "failed password for " $1 | grep -ive "invalid" | awk '{print $9}' | sort \
    | uniq -c | sort -n -r |head -n 10 >>  top_10_target_names.txt

    cat top_10_target_names.txt
fi

