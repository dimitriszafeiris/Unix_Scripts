#!/bin/bash

#Different ways to iterate over your given arguments on a shell script.

#1st way - in a row
echo $@

#2nd way - in columns
for i; do
    echo $i
done

#3rd way - in columns
for i in $*; do
   echo $i
done

#4rth way - in columns
for var in "$@"
do
    echo "$var"
done

#5fth way - in columns
while (( "$#" )); do
  echo $1
  shift   # BE CAREFUL HERE. After executing shift command, you cannot use given arguments as usual.
done
