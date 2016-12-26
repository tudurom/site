#!/bin/sh

usage() {
	echo "Usage: ./mkpost.sh <name>"
	exit 1
}

test "$#" -eq 1 || usage

cp -R tm "$1"
