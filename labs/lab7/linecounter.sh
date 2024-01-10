#!/bin/bash

count=0
for file in `find "$1" -name "*.c" -o -name "*.h"`
do
linesinfile=$(grep -c -v ^$ $file)
count=$(($count + $linesinfile))
echo $file $linesinfile
done
echo "Количество непустых строк: " $count
