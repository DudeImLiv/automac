# Visual Studio Code Extensions

- [Visual Studio Code Extensions](#visual-studio-code-extensions)
- [Extensions](#extensions)
  - [Highlighted Recommendation](#highlighted-recommendation)
  - [Functional \& Practical](#functional--practical)
  - [Visual \& Readability](#visual--readability)
  - [File \& Workspace Navigation](#file--workspace-navigation)
  - [Language-Specific](#language-specific)
    - [Python](#python)
    - [Java](#java)

# Extensions

## Highlighted Recommendation

**Markdown All in One** by Yu Zhang

All you need to write Markdown (keyboard shortcuts, table of contents, auto preview & more). For more information on using Markdown, see [Markdown](markdown.md).

***Note:*** *This extension can also be configured to a shortcut to easily view a .md file, which is ***highly recommended*** when viewing .md files. I personally use ⇧⌘V but you can pick your own poison based on your natural workflow.*

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

<!-- ----------------------- Functional & Practical ------------------------ -->

## Functional & Practical

**Code Spell Checker** by Street Side Software

This extension lives up to its name. It provides a basic spell checker to find and fix spelling errors throughout your codebase. Misspelled words are indicated with a squiggly underline. It is available in many languages.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Error Lens** by Alexander

Improves highlighting of errors, warnings, and other language diagnostics. This is a great debugging and error-prevention tool to have.

Errors will not go unnoticed with this extension. Error and warnings are made prominent by highlighting the entire line, along with the related message printed inline.

*There is support for multiple languages which makes it a valuable for developers working in projects in different languages. You can also configure the appearance and behavior of errors and warnings.*

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Markdown Preview Enhanced** by Yiyi Wang

Markdown Preview Enhanced ported to vscode and can be used as simpler alternative (or companion) to [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one). For more information on using Markdown, see [Markdown](markdown.md).

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Multiple Cursor Case Preserve** by Cardinal90

This extension enhances multiple cursor editing (⌥-click) by preserving the case of each selected instance.

For example, if you’re replacing the word 'element' with 'component' and your selections include 'element', 'Element', and 'ELEMENT', the extension ensures they become 'component', 'Component', and 'COMPONENT' — keeping the original casing style intact across all replacements.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=Cardinal90.multi-cursor-case-preserve) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Path Intellisense** by Christian Kohler

Path Intellisense is a file path productivity tool. It has intelligent auto-completion that dynamically suggests file paths and directory names as you type. It can minimize errors due to incomplete or wrong file paths.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Prettier ESLinter** by Prettier

When you choose 'Format Document' from the command menu, you'll be asked to set a 'Default Formatter' if you haven't already. is a widely embraced code formatting tool with over 40 million installations. It provides you with a shared solution to improve code readability.

This opinionated code formatter enforces consistent style throughout a codebase. With support for various programming languages, Prettier automatically analyzes and formats code according to a set of standardized rules, this eliminates debates over coding style and enhancing collaboration.

Prettier's integration with "format on save" in VSCode vastly increases productivity by automatically applying formatting, preventing any time spent on manual formatting concerns.

You've probably already heard about Prettier, nonetheless it's important to mention as one of the top extensions to have.

*Variations of Prettier can be found by searching extensions for 'Prettier' or 'ESLinters'*

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Project Manager** by Alessandro Fragnani

Project Manager is a simple tool to set projects (aka Favorites) and access them. It includes a dedicated side bar section to manage all of your projects in one place.

This is great tool when you have a lot of projects to manage and need to frequently switch between them. It comes with a set of handy features like the ability to further organize projects by tags.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Smart Insert Date** by Satoshi Yamamoto *(Editor's Choice)*

This extension inserts formatted dates and times into the editor.

Dates can be selected in weeks, months or years, configurable in the extension's settings. 

***Editor's Note*** *During personal projects, I use this extension (keybinding) often to indicate when I did something. Like, when I'm testing a change, I'll use [Comment Anchors](#file-and-workspace-navigation) (where I've configured anchors like TEST, TODO, and FIX) in conjunction with this extension so I know what time/date I ran a test or broke something. I also have a NOTE tag where I leave a note and I'll place the date/time out beside it to refer back to later in the week. Sometimes, this date/time will tell me I changed one thing, and then changed another and I'll be able to tell what I was thinking or my process I was trying to follow when I need to record any documentation. I use this extension to most frequently when I add 'rev \#.\#.\#' to a file's header area, including a line for 'last updated:' followed by quickly hitting this keybinding to add the date/time a file was last touched.*

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=SatoshiYamamoto.vscode-smart-insert-date) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

<!-- ------------------------ Visual & Readability ------------------------- -->

## Visual & Readability

**colorize** by kamikillerto

Instantly visualize css colors in your css/sass/less/postcss/stylus/XML... files.

This extension your styles files looking for colors and generate a colored background (using the color) for each of them, rather than the tiny square shown by default.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=kamikillerto.vscode-colorize) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Comment Divider** by stackbreak

Divide your code by sections with styled separators.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=stackbreak.comment-divider) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**indent-rainbow** by oderwat

A colorful extension that you can use to make indentation comprehensible, aiding in maintaining well-organized and properly indented code.

Each indent is marked with a different color, alternating between 4 different colors. The colorful representation of the structure is not only useful but also visually appealing. This extension is particularly useful for languages that rely heavily on indentation such as YAML or Python.

*You can configure the colors if the default is not to your liking.*

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Icon Themes**

While VSCode includes default icons, incorporating icon packs provides an excellent means to boost productivity and infuse a visually appealing aesthetic into the editor.

Icon packs provide a more extensive and visually recognizable set of icons compared to the defaults. This can make it easier for visual distinction between file types and folders. It can build intuitive recognition and reduce the cognitive load when navigating through files.

There are plenty of options when it comes to choosing an icon pack. Three popular choices are the [Material Theme Icons](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme-icons), [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons), and [file-icons](https://marketplace.visualstudio.com/items?itemName=file-icons.file-icons).

I find that a good set of icons improves the overall readability of the file explorer. I enjoy the added benefits of the upgraded visual experience.

Icon Themes can be found by searching for them online or by searching for it in Visual Studio Code's *Extensions* panel.

<!-- --------------------- File & Workspace Navigation --------------------- -->

## File & Workspace Navigation

**Comment Anchors** by Starlane Studios *(Personal Recommendation)*

Place anchors within comments or strings to place bookmarks within the context of your code. Anchors can be used to track TODOs, write notes, create foldable sections, or to build a simple navigation making it easier to navigate your files.

Anchors can be viewed for the current file, or throughout the entire workspace, using an easy to use sidebar.

Comment Anchors provides many configuration options, allowing you to tailor this extension to your personal workflow, and increase productivity.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=ExodiusStudios.comment-anchors) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Better Comments** by Aaron Bond *(Community Favorite)*

Better Comments helps you strengthen the comments in code. Code comments are beneficial for readability, and providing explanations or context for future reference. Leaving good code comments can save others and yourself time in the future.

Supported features include the ability to categorize the annotations from alerts, writing queries, making a TODO list, and showing highlights. There is an extensive list of supported languages.

Lines of code that are commented out are styled to be dark gray with a text strikethrough, emphasizing their exclusion and signaling that they should be removed.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Bookmarks** by Alessandro Fragnani

Bookmarks allows you to bookmark positions in your code. These lines are noted with a blue bookmark icon. Bookmarks can be organized and named to allow for quick reference and can be used as a simpler alternative to [Comment Anchors](https://marketplace.visualstudio.com/items?itemName=ExodiusStudios.comment-anchors).

All of the bookmarks can be found in a dedicated sidebar section. This is a great tool to improve navigation, and to help you spend lest time searching for references.

You can find the [extension](http://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

<!-- -------------------------- Language-Specific -------------------------- -->

## Language-Specific

### Python

**Pylance** by Microsoft

Pylance is an extension that works alongside Python in Visual Studio Code to provide performant language support. Under the hood, Pylance is powered by Pyright, Microsoft's static type checking tool. Using Pyright, Pylance has the ability to supercharge your Python IntelliSense experience with rich type information, helping you write better code faster.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Python** by Microsoft

Python language support with extension access points for IntelliSense (Pylance), Debugging (Python Debugger), linting, formatting, refactoring, unit tests, and more.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Python Debugger** by Microsoft

Python Debugger (using debugpy) provides a seamless debugging experience by allowing you to set breakpoints, step through code, inspect variables, and perform other essential debugging tasks. The debugpy extension offers debugging support for various types of Python applications including scripts, web applications, remote processes, and multi-threaded processes.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

### Java  

**Debugger for Java** by Microsoft

A lightweight Java Debugger based on Java Debug Server which extends the Language Support for Java by Red Hat. It allows users to debug Java code using Visual Studio Code (VS Code). Here's a list of features:

- Launch/Attach
- Breakpoints/Conditional Breakpoints/Logpoints
- Exceptions
- Pause & Continue
- Step In/Out/Over
- Variables
- Callstacks
- Threads
- Debug console
- Evaluation
- Hot Code Replace

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**IntelliCode** by Microsoft

This extension provides AI-assisted development features for Python, TypeScript/JavaScript and Java developers in Visual Studio Code, with insights based on understanding your code context combined with machine learning.

You'll need Visual Studio Code October 2018 Release 1.29.1 or later to use this extension. For each supported language, please refer to the "Getting Started" section below to understand any other pre-requisites you'll need to install and configure to get IntelliCode completions.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Language Support for Java** by Red Hat

Provides Java ™ language support via Eclipse ™ JDT Language Server, which utilizes Eclipse ™ JDT, M2Eclipse and Buildship.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=redhat.java) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.

**Test Runner for Java** by Microsoft

A lightweight extension to run and debug Java test cases in Visual Studio Code.

You can find the [extension](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-test) on the Visual Studio Marketplace or by searching for it in Visual Studio Code's *Extensions* panel.
