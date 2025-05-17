#!/bin/bash

# usage: this script will rename the selected file or files to PascalCase. if folder is selected, it will recurse into the folder and rename all files within the folder so be careful. 

rename_item() {
    local oldpath="$1"
    local dir=$(dirname "$oldpath")
    local base=$(basename "$oldpath")

    # remove commas, convert separators to spaces, then capitalize words and join
    local newbase=$(echo "$base" | tr -d ',' | sed -E 's/[-_ ]+/\n/g' | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}' | tr -d '\n')

    local newpath="${dir}/${newbase}"

    # if path changes, rename it
    if [[ "$oldpath" != "$newpath" ]]; then
        mv "$oldpath" "$newpath"
    fi

    # if it's a directory, recurse into new path
    if [[ -d "$newpath" ]]; then
        find "$newpath" -mindepth 1 -maxdepth 1 | while read child; do
            rename_item "$child"
        done
    fi
}

# execution
for f in "$@"; do
    rename_item "$f"
done