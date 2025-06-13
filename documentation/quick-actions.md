# Quick Actions

- [Quick Actions](#quick-actions)
  - [Open in VSCode](#open-in-vscode)
  - [List Files](#list-files)
  - [List Directories](#list-directories)
  - [KebabCase](#kebabcase)
  - [Get Path](#get-path)
  - [Doc to Docx](#doc-to-docx)
  - [Docx to MD](#docx-to-md)
  - [MD to TXT](#md-to-txt)

Each of these Quick Actions will be created inside the Automator application, saved within the 'Services' folder. To find the 'Services' folder, 

## Open in VSCode

**Usage**
Opens the selected file or folder in VSCode.

**Instructions**

1. Open Automator from your Applications folder
2. Select "Quick Action" as the document type
3. In the Workflow settings:
   - Set "Workflow receives current" to "files or folders"
   - Set "in" to "Finder"
4. From the actions library, search for and add "Run AppleScript"
   - Important Note: only .applescript files will 'Run AppleScript', otherwise .sh files 'Run Shell Script' in Automator.
5. Replace the default script with the following:

``` applescript
on run {input, parameters}
	repeat with i in input
		set selectedFolder to POSIX path of (i as alias)
		do shell script "/usr/local/bin/code " & quoted form of selectedFolder
	end repeat
	return input
end run
```

*Note: File saved as 'open-in-vscode.applescript'; .applescript is the extension granted to AppleScript files, will allow VSCode ignore syntax errors.*

6. Save the quick action with a name like "Open in VSCode"
7. To use the Quick Action:
   - Right-click on a folder in Finder
   - Go to Quick Actions
   - Select "Open in VSCode"
   - Optional: Assign a Keyboard Shortcut to this Quick Action, see 'Mac Tips' for instructions.

***Important Note: Make sure you have VSCode installed and the `code` command line tool is available in your path.***

## List Files

**Usage**
Lists all files in the selected directory with their sizes and copies the output to clipboard.

**Instructions**

1. Open Automator from your Applications folder
2. Select "Quick Action" as the document type
3. In the Workflow settings:
   - Set "Workflow receives current" to "folders"
   - Set "in" to "Finder"
4. From the actions library, search for and add "Run Shell Script"
5. Replace the default script with the following:

```shell
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

        echo "✔ File/folder list copied to clipboard"
    fi
done
```

6. Save the quick action with a name like "List Files"
7. To use the Quick Action:
   - Right-click on a folder in Finder
   - Go to Quick Actions
   - Select "List Files"

*Note: The `pbcopy` command used in these scripts is a built-in macOS utility that copies text to the clipboard. No additional installation is required.*

## List Directories

**Usage**
Lists all directories and their contents in a hierarchical format, copying the output to clipboard.

**Instructions**

1. Open Automator from your Applications folder
2. Select "Quick Action" as the document type
3. In the Workflow settings:
   - Set "Workflow receives current" to "folders"
   - Set "in" to "Finder"
4. From the actions library, search for and add "Run Shell Script"
5. Replace the default script with the following:

```shell
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
```

6. Save the quick action with a name like "List Directories"
7. To use the Quick Action:
   - Right-click on a folder in Finder
   - Go to Quick Actions
   - Select "List Directories"

*Note: The `pbcopy` command used in these scripts is a built-in macOS utility that copies text to the clipboard. No additional installation is required.*

## KebabCase

***Note: This can be changed out for any of the naming-conventions found in quick-actions/naming-conventions/ but kebab-case tends to be the easiest because no modifier keys (i.e. ⇧) are needed to type it out.***

**Usage**
Converts selected files and folders to kebab-case format.

**Instructions**

1. Open Automator from your Applications folder
2. Select "Quick Action" as the document type
3. In the Workflow settings:
   - Set "Workflow receives current" to "files or folders"
   - Set "in" to "Finder"
4. From the actions library, search for and add "Run Shell Script"
5. Replace the default script with the following:

```shell
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
```

6. Save the quick action with a name like "KebabCase"
7. To use the Quick Action:
   - Right-click on files or folders in Finder
   - Go to Quick Actions
   - Select "KebabCase"

## Get Path

**Usage**
Copies the full path of selected files to clipboard.

**Instructions**

1. Select "Quick Action" as the document type
2. In the Workflow settings:
   - Set "Workflow receives current" to "files or folders"
   - Set "in" to "Finder"
3. From the actions library, search for and add "Run Shell Script"
4. Replace the default script with the following:

```shell
for f in "$@"; do
    echo "$f"
done | pbcopy
```

5. Save the quick action with a name like "Get Path"
6. To use the Quick Action:
   - Right-click on files or folders in Finder
   - Go to Quick Actions
   - Select "Get Path"

*Note: The `pbcopy` command used in these scripts is a built-in macOS utility that copies text to the clipboard. No additional installation is required.*

## Doc to Docx

**Usage**
Converts .doc files to .docx format.

**Instructions**

1.  Select "Quick Action" as the document type
2. In the Workflow settings:
   - Set "Workflow receives current" to "files"
   - Set "in" to "Finder"
3. From the actions library, search for and add "Run Shell Script"
4. Replace the default script with the following:

```shell
for f in "$@"; do
    output_file="${f%.*}.docx"
    textutil -convert docx "$f"
    echo "Converted $f to $output_file"
done
```

5. Save the quick action with a name like "Doc to Docx"
6. To use the Quick Action:
   - Right-click on .doc files in Finder
   - Go to Quick Actions
   - Select "Doc to Docx"

*Note: Requires macOS's built-in textutil command.*

## Docx to MD

**Usage**
Converts .docx files to Markdown format.

**Instructions**

1. Select "Quick Action" as the document type
2. In the Workflow settings:
   - Set "Workflow receives current" to "files"
   - Set "in" to "Finder"
3. From the actions library, search for and add "Run Shell Script"
4. Replace the default script with the following:

```shell
pandoc_path="/opt/homebrew/bin/pandoc"

for f in "$@"; do
    "$pandoc_path" "$f" -t markdown -o "${f%.*}.md"
done
```

5. Save the quick action with a name like "Docx to MD"
6. To use the Quick Action:
   - Right-click on .docx files in Finder
   - Go to Quick Actions
   - Select "Docx to MD"

***Important Note: Requires pandoc to be installed via Homebrew, `brew install pandoc` and verify the path by running `which pandoc`. If the path is different from `/opt/homebrew/bin/pandoc`, update the `pandoc_path` variable in the script accordingly.***

## MD to TXT

**Usage**
Converts Markdown files to plain text format.

**Instructions**

1. Select "Quick Action" as the document type
2. In the Workflow settings:
   - Set "Workflow receives current" to "files"
   - Set "in" to "Finder"
3. From the actions library, search for and add "Run Shell Script"
4. Replace the default script with the following:

```shell
pandoc_path="/opt/homebrew/bin/pandoc"

for f in "$@"; do
    "$pandoc_path" "$f" -t plain -o "${f%.*}.txt"
done
```

5. Save the quick action with a name like "MD to TXT"
6. To use the Quick Action:
   - Right-click on .md files in Finder
   - Go to Quick Actions
   - Select "MD to TXT"

***Important Note: Requires pandoc to be installed via Homebrew, `brew install pandoc` and verify the path by running `which pandoc`. If the path is different from `/opt/homebrew/bin/pandoc`, update the `pandoc_path` variable in the script accordingly.***
