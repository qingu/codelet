#!/bin/bash 
# purpose: extract mean/max/min time info from gptl timing.summary file

fname=${1:?"need timing file"}

# $1 - function; $4-mean; $6-max; $9-min
awk 'NR>=11{print $1","$4","$6","$9","}' $fname > $fname.csv
