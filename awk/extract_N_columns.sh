awk '{ for (i=3; i<=NF; i++) printf "%s ", $i; printf "\n" }' table.txt
