#!/bin/bash

if  [ -z "$@" ]
then
        echo "input empty"
        exit 1
fi
for user in "$@"
do
        userdel $user -r
done
exit 0

