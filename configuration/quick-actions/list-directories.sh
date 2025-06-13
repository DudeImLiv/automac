#!/bin/bash

# usage: 

for target in "$@"; do
    if [ -d "$target" ]; then
        (
	# step 1: sorted list of subdirectories (captured in array)
            find "$target" -mindepth 1 -maxdepth 1 -type d | sort | while IFS= read -r dir; do
                dirname=$(basename "$dir")
                [[ "$dirname" == .* ]] && continue
                echo "/$dirname"
			
	# sorted files in subdirectory
                find "$dir" -maxdepth 1 -type f | sort | while IFS= read -r subfile; do
                    fname=$(basename "$subfile")
                    [[ "$fname" == .* ]] && continue
                    echo "- $fname"
                done 
            done

            # step 2: sorted top-level files
            # commented out unless you want to include top-level files
            # find "$target" -maxdepth 1 -type f | sort | while IFS= read -r file; do
            #     fname=$(basename "$file")
            #     [[ "$fname" == .* ]] && continue
            #     echo "$fname"
            # done
        ) | pbcopy

        echo "✔ Output copied to clipboard (with spacing between folders)"
    fi
done