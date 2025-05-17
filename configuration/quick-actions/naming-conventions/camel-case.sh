#!/bin/bash

# usage: this script will rename the selected file or files to camelCase. if folder is selected, it will recurse into the folder and rename all files within the folder so be careful. 

rename_item() {
    local oldpath="$1"
    local dir=$(dirname "$oldpath")
    local base=$(basename "$oldpath")

    # remove commas, convert to words
    local words=($(echo "$base" | tr -d ',' | sed -E 's/[-_ ]+/\n/g'))

    # build camelCase: lowercase first word, capitalize the rest
    local newbase="${words[0],}"  # lowercase first word
    for ((i = 1; i < ${#words[@]}; i++)); do
        word="${words[i]}"
        newbase+=$(echo "${word:0:1}" | tr '[:lower:]' '[:upper:]')$(echo "${word:1}" | tr '[:upper:]' '[:lower:]')
    done

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