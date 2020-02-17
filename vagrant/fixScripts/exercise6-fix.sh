#!/bin/bash
#add fix to exercise6-fix here

if (( $# < 2 ))
then
        echo "Please insert 2 or more arguments"
        exit
fi

dest=`echo $@ | cut -d " " -f $#`
files=`echo $@ | cut -d " " -f 1-$(( $# - 1 ))`

if [ $HOSTNAME == server1 ]
then
        rsync -v $files server2:/$dest | cut -d " " -f 4
else 
        rsync -v $files server1:/$dest | cut -d " " -f 4
fi

