#!/bin/bash

# @param {string} $1 String to hash to a positive number
stringsum() {
    echo "md5sum,md5" | tr ',' '\n' | while read -r cmd; do
        if [[ -x "$(command -v "${cmd}")" ]]; then
            num=$(( 0x$(echo "$1" | command "${cmd}" | cut -d ' ' -f 1 | head -c 15) ))
            [[ $num -lt 0 ]] && num=$((num * -1))
            echo $num
            return 0
        fi
    done
    return 1
}

stringsum "foo"
