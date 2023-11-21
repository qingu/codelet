#!/bin/bash
set -x

myfunc() {
    echo me $0
    echo 'function arg[0]=' $0
    echo 'function arg[1]=' $1
    echo 'function arg[2]=' $2
}

echo 'script arg[0]=' $0
echo 'script arg[1]=' $1
echo 'script arg[2]=' $2

myfunc func1 func2
