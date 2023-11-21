#!/bin/bash 
# purpose: learn 'while construct' synatx

while read -r line
do
    echo $line 
done < a.txt

i=1
while read -r line < a.txt
do
    ((i++))
    echo $i $line 
done 
