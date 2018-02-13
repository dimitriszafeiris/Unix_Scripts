#!/bin/bash

#Checking md5...

#Create a file with all md5 codes, from .md5 files

cut -d ' ' -f 1 *.md5 > tstmd5.txt

#Create a file with all md5 codes, from .ova files

md5sum *.ova | cut -d ' ' -f 1 > tstova.txt

DIFF=$(diff tstmd5.txt tstova.txt)

if [ "$DIFF" != "" ]

then
    echo "md5 is different, aborting..."
    exit 1
fi

#Removing files...
rm tstmd5.txt tstova.txt

exit 0