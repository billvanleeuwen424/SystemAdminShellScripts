#!/bin/bash

if  [ -z "$@" ]
then
        echo "input empty"
        exit 1
fi
for user in "$@"
do

        useradd $user -m

        echo linux | passwd --stdin $user
done
exit 0


