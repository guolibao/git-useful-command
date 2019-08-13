#!/bin/sh
# svn merge -r Head:{"2019-06-13 15:09"} .
DATE="$1"

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_WHITE="\033[0;37m"
COLOR_OFF="\033[0;39m"

for dir in `find ./ExternalLibs/ -type d`; do
    if [ -d $dir/.svn ]
    then
	svn merge -r Head:{"$DATE"} $dir
	if [ "$?" != 0 ]
	then
	    echo "${COLOR_RED}=======================================================${COLOR_OFF}"
	    echo "${COLOR_RED}error: svn merge -r Head:{"$DATE"} $dir ${COLOR_OFF}"
	    echo "${COLOR_RED}=======================================================${COLOR_OFF}"
	    exit 1
	else
	    echo "svn merge -r Head:{"$DATE"} $dir successful"
	fi

    fi

done


for dir in `find ./Solutions/ -type d`; do
    if [ -d $dir/.svn ]
    then
	svn merge -r Head:{"$DATE"} $dir
	if [ "$?" != 0 ]
	then
	    echo "${COLOR_RED}=======================================================${COLOR_OFF}"
	    echo "${COLOR_RED}error: svn merge -r Head:{"$DATE"} $dir ${COLOR_OFF}"
	    echo "${COLOR_RED}=======================================================${COLOR_OFF}"
	    exit 1
	else
	    echo "svn merge -r Head:{"$DATE"} $dir successful"
	fi

    fi

done
