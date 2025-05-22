# Export Markdown

*Exports a webpage as a downloaded Markdown file.*

This script works on webpages (HTML) that are derived from a Markdown file, like Github or other Doc-like Wikis. Using your Dev Tools, you will paste this script into the console and it will download a Markdown.md file of the webpage.  

This is great because it easily allows you to create local \*.md files of pertinent data, in the event you needed to easily parse or scrub the content of a page like a wiki. Markdown files can easily be turned into txt files, if needed, too. See [Quick Actions](../../documentation/quick-actions.md#md-to-txt) for an example.

*If you don't know if it's originally markdown, it's ***definitely*** worth running it though, just to see if it works on a page.* 

**Instructions**

Run the following script inside of the Broswer Console:

*Note: The Console may request that you run a specific command to allow scripts to be run inside the browser. This has been tested on both Chrome and Brave Browsers.*

```
(async function() {
  // load turndown
  const script = document.createElement("script");
  script.src = "https://cdn.jsdelivr.net/npm/turndown/dist/turndown.min.js";
  document.head.appendChild(script);

  script.onload = () => {
    const turndownService = new TurndownService({ headingStyle: 'atx' });

    // add markdown table support
    turndownService.addRule('table', {
      filter: function (node) {
        return node.nodeName === 'TABLE';
      },
      replacement: function (content, node) {
        const rows = Array.from(node.querySelectorAll('tr')).map(row => {
          const cells = row.querySelectorAll('th, td');
          return '| ' + Array.from(cells).map(cell => cell.textContent.trim()).join(' | ') + ' |';
        });

        // add header separator (if table has a <thead> or starts with <th>)
        if (rows.length > 1) {
          const headerCells = node.querySelectorAll('thead th, tr:first-child th');
          if (headerCells.length > 0) {
            const separator = '| ' + Array.from(headerCells).map(() => '---').join(' | ') + ' |';
            rows.splice(1, 0, separator);
          }
        }

        return '\n\n' + rows.join('\n') + '\n\n';
      }
    });

    // you can also add any other markdown-specific formatting you want here

    // grab the main content container
    const content = document.querySelector("main") || document.body;

    if (!content) {
      alert("No content found.");
      return;
    }

    const markdown = turndownService.turndown(content.innerHTML);

    const blob = new Blob([markdown], { type: "text/markdown" });
    const url = URL.createObjectURL(blob);
    const filename = (document.title || "page").replace(/[^\w\d]+/g, "_").substring(0, 50) + ".md";

    const a = document.createElement("a");
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };
})();
```

*Note: This script includes a Turndown plugin to export tables properly.*