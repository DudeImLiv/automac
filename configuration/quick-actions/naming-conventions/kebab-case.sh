#!/bin/bash

# usage: this script will rename the selected file or files to kebab-case. if folder is selected, it will recurse into the folder and rename all files within the folder so be careful. 

rename_item() {
    local oldpath="$1"
    local dir=$(dirname "$oldpath")
    local base=$(basename "$oldpath")

    # ---------- CHOOSE YOUR KEBAB STYLE ----------
    # choose one of the following options by leaving the preferred option as the only uncommented option... 
    # lowercase-kebab-case
    newbase=$(echo "$base" | tr '[:upper:]' '[:lower:]' | tr ' _' '-' | tr -d ',')

    # Title-Kebab-Case
    # newbase=$(echo "$base" | tr -d ',' | sed -E 's/[ _]+/-/g' | awk -F'-' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); OFS="-"} 1')

    # UPPERCASE-KEBAB-CASE
    # newbase=$(echo "$base" | tr '[:lower:]' '[:upper:]' | tr ' _' '-' | tr -d ',')

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
