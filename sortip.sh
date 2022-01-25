#! /bin/bash

#   Name: sortip.sh
#
#   Purpose: search through list of IP addresses
#            find the top ten
#            output them to a .txt document
#            get the geolocation for the top two ip's
#
#   Written By: William Van Leeuwen, January 2022
#       
#   Usage: ./sortip.sh [filepath]  

#clear the list if exists
if [[ -f top_ten_ip.txt ]]
then
    rm top_ten_ip.txt
fi


if [[ -z $1 ]];
then 
    echo -e "\nError!"
    echo -e "./sortip.sh [filepath]"
else
    #get offending ip addresses and sort/count them. output them to the file.
    grep -ie "failed password for" $1 | grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'| sort \
    | uniq -c | sort -n -r |head -n 10 >> top_ten_ip.txt

    #loop over the two ip's, wget the info, print it, and delete the file
    for ip in $(head -n2 top_ten_ip.txt | awk '{print $2}')
    do
        wget http://ipinfo.io/$ip
        cat $ip
    done
fi
