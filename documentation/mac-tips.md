# MacOS Tips

## Table of Contents
- [MacOS Tips](#macos-tips)
  - [Table of Contents](#table-of-contents)
- [Basic Configuration](#basic-configuration)
  - [File Naming Conventions](#file-naming-conventions)
  - [Right-Click](#right-click)
  - [Quick Actions](#quick-actions)
  - [Keyboard Shortcuts](#keyboard-shortcuts)
    - [Quick Actions](#quick-actions-1)

# Basic Configuration

## File Naming Conventions

It's advisable to choose a naming convention you prefer early on when it comes to computer programming. The reason for this is that when you're running commands in your terminal, or navigating to a specific file or folder, if it contains spaces, then you will have to escape ('\') the spaces, otherwise, the computer recognizes everything after the space as command and not content — for commands in the terminal, a space is an indicator of the next command; a divider, of sorts. 

Examples: 

`cd ~/path/to/folder/named/Like This`

The computer reads the following:
`cd`
`~/path/to/folder/named/Like`
`This`
and will hit you with an error that either the folder doesn't exist, the command cannot be found, or *both*.

There are three ways to avoid this:

**Option 1:** Encasing the entire path in quotation marks.
`cd "~/path/to/folder/named/Like This"`

**Option 2:** Escaping the trailing character using a backslash.
`cd "~/path/to/folder/named/Like\ This"`

**Option 2:** Naming your files using a naming convention that avoids spaces.
`cd ~/path/to/folder/named/like-this`

Popular naming conventions include:

**Camel Case:**

Camel Case is a naming convention where words are joined together, and each word's first letter, except the first one, is capitalized. It is commonly used in programming languages like Java, JavaScript, and C#. This convention is useful for naming variables, functions, and methods.

> Example: camelCaseExample

**Pascal Case:**

Pascal Case is similar to Camel Case, but the first letter of the word is also capitalized. It is often used for naming classes, interfaces, and other types in various programming languages, including C#, C++, and Swift.

> Example: PascalCaseExample

**Snake Case:**

Snake Case is a naming convention where words are separated by underscores (\_) with all lowercase letters. It is commonly used in Python for naming variables, constants, and sometimes functions.

> Example: snake\_case\_example

<!-- backwards-slash is only visible in raw markdown, telling Markdown to ignore the trailing character as it is content rather than command. -->

**Kebab Case:**

Kebab Case is similar to Snake Case, but instead of underscores, words are separated by hyphens (-). It is frequently used in URLs, HTML attributes, and CSS classes.

> Example: kebab-case-example

Choosing the right naming convention is important in writing clean and readable code. While Camel Case and Pascal Case are more prevalent in general programming and .NET development, Snake Case and Kebab Case are favored in specific contexts like Python and HTML/CSS. Understanding the strengths and best practices of each naming convention allows developers to make informed decisions based on the language, context, and project requirements. 

*Kebab Case is the easier of the options due to the lack of modifier keys (i.e. ⇧) necessary to type it out.*

## Right-Click

MacOS doesn't have the right-click feature turned on by default. You can fix this by navigating to Settings → Mouse → Secondary Click and select 'Click Right-Side' from the dropdown.

## Quick Actions

Quick Actions are created within the 'Automator' application and utilized in the right-click menu. Quick Action files are stored in the 'Services' folder in your 'Library'.

If you need to locate your Services folder inside of Finder, you can find it by navigating to your root directory, which is found inside your Macintosh HD folder, inside of the 'Users' directory. This will open up a folder that looks like:
   - Applications
   - Desktop
   - Documents
   - Downloads
   - Movies
   - Music
   - Pictures
   - Public

***By default, you won't see the 'Library' folder here, but you can turn it 'on' by right-clicking inside the directory, selecting 'Show View Options' and ticking the 'Show Library folder' at the bottom of the window that pops up.***

To add it to your Sidebar for ease of accesss, you can drag it to the sidebar in your Finder, being careful to not hover over a folder in the sidebar but *between* the folders. 
Note: This is how you add folders to the sidebar for ease of access... 'Services' is a good one to have here if you want to use Quick Actions or any other Automator scripts on Mac OS, just so they're easy to get to.

All of the Quick Actions saved within your 'Services' folder can be found in this directory, and this is where you can save Quick Action files shared by others. A few Quick Actions that come in handy are (see quick-actions.md):
   - Open in VSCode (can be both files and folders)
   - List Files: lists the files within a folder
   - List Directories: lists the subdirectories within a folder
   - KebabCase: reformats a filename using kebab-case, to avoid having to escape spaces when navigating to a path using 'cd' in terminal.
   - Get Path: copies complete path, including filename, to the clipboard
   - Document Control Quick Actions:
     - Doc to Docx: converts .doc to .docx
     - Docx to MD: converts .doc to .md (Markdown)
     - MD to TXT: converts .md to .txt
     - Note – these will help you convert documents to other formats quickly, and in bulk when necessary, to upload to various platforms, to parse the text better (i.e. ChatGPT)

## Keyboard Shortcuts

### Quick Actions

Once you begin creating your own Quick Actions (or installing pre-made Quick Actions), you can create Keyboard shortcuts to use them while in the Finder application (see [Quick Actions](#quick-actions))

**Instructions**
1. Navigate to Settings → Keyboard → Keyboard Shortcuts
2. You will find multiple options here under 'Keyboard Shortcuts'...
   a. For now, we are looking for 'Services' → 'Files and Folders'
   b. This will list all of the Quick Actions saved in your 'Services' folder... 
3. To the right, you'll see 'none' – this field can be selected to record a new keyboard shortcut.

