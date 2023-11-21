#!/bin/bash 
#set -x

#for i in 1 2 3 4 5 6 
#do
#    echo $i 
#done
#
#for i in {1..6}; do
#    echo $i 
#done
#
#for i in {1..9..2}; do echo i$i; done
#
#for ((i=1; i<=6; i++))
#do 
#    echo $i
#done

years=(2010 2013 2020 2023)

for year in "${years[@]}"
do 
    echo $year 
done
for i in "${!years[@]}"
do 
    echo ${years[i]}
done
