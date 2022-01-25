#! /bin/bash

#   Name: getfailedinvaliduser.sh
#
#   Purpose: search through list of IP addresses
#            find the top ten where usernames are invalid
#            output them to a .txt document
#            print out the usernames
#
#   Written By: William Van Leeuwen, January 2022
#   
#   Usage: ./getfailedinvaliduser.sh [filename]

#clear the list if exists
if [[ -f top_10_target_invalid_names.txt ]]
then
    rm top_10_target_invalid_names.txt
fi


if [[ -z $1 ]];
then 
    echo -e "\nError!"
    echo -e "./getfailedinvaliduser.sh [filepath]"
else

    echo -e "\n logging to top_10_target_invalid_names.txt"

    #get offending usernames that are invalid and sort/count them
    grep -ie "failed password for " $1 | grep -ie "invalid" | awk '{print $11}' | sort \
    | uniq -c | sort -n -r |head -n 10 >>  top_10_target_invalid_names.txt

    cat top_10_target_invalid_names.txt
fi



