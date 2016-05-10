#!/bin/sh

test "$#" -eq 1 || (echo "Usage: ./mkpost.sh <name>" && exit 1)

cp -R tm "$1"
