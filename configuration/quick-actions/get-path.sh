#!/bin/bash

# usage: this script will copy the full path of the selected 
# file to the clipboard, including the filename.

for f in "$@"; do
    echo "$f"
done | pbcopy