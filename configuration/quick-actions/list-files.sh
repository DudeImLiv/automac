#!/bin/bash

# usage: this script will copy the names of all files within a directory to the clipboard, must be run on a folder in the Finder.

for target in "$@"; do
    if [ -d "$target" ]; then
        find "$target" -maxdepth 1 ! -path "$target" | while IFS= read -r item; do
            name=$(basename "$item")
            
            # skip hidden files/folders (starting with .)
            [[ "$name" == .* ]] && continue

            if [ -f "$item" ]; then
                echo "$name"
            elif [ -d "$item" ]; then
                echo "$name/"
            else
                echo "$name (unknown type)"
            fi
        done | sort | pbcopy

        echo "✔ File/folder list copied to clipboard"s
    fi
done