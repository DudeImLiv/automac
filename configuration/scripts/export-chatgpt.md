# Export ChatGPT Conversation

*Exports a webpage as a downloaded Markdown file.*

This script works only on single ChatGPT conversations using your browser, collecting all of the inputs and returns and exports it into a Markdown file. Using your Dev Tools, you will paste this script into the console and it will download a Markdown.md file of the conversation. 

This is great because it easily allows you to create local \*.md files of pertinent data, in the event you needed to easily parse or scrub the content or refer to conversations easier. Markdown files can easily be turned into txt files, if needed, too. See [Quick Actions](../../documentation/quick-actions.md#md-to-txt) for an example.

**Instructions**

Run the following script inside of the Browser Console:

*Note: The Console may request that you run a specific command to allow scripts to be run inside the browser. This has been tested on both Chrome and Brave Browsers.*

```
function h(html) {
    return html
        .replace(/<p>/g, '\n\n')
        .replace(/<\/p>/g, '')
        .replace(/<b>/g, '**')
        .replace(/<\/b>/g, '**')
        .replace(/<i>/g, '_')
        .replace(/<\/i>/g, '_')
        .replace(/<code[^>]*>/g, (match) => {
            const langMatch = match.match(/class="[^"]*language-([^"]*)"/);
            return langMatch ? '\n```' + langMatch[1] + '\n' : '\n```';
        })
        .replace(/<\/code[^>]*>/g, '```')
        .replace(/&nbsp;/g, ' ')
        .replace(/&amp;/g, '&')
        .replace(/&lt;/g, '<')
        .replace(/&gt;/g, '>')
        .replace(/&#39;/g, "'")
        .replace(/&quot;/g, `"`)
        .replace(/<[^>]*>/g, '') // catch-all for remaining HTML
        .replace(/Copy code/g, '')
        .replace(/This content may violate our content policy[^]*?area\./g, '')
        .replace(/:(\S)/g, ':\n$1')
        .trim();
}
(() => {
    const articles = document.querySelectorAll("article");
    let output = "";
    let promptCount = 1;
    let responseCount = 1;
    let lastPrompt = "";
    let lastResponse = "";

    function isDuplicate(newText, lastText) {
        const newWords = newText.split(/\s+/).slice(0, 20).join(' ');
        const lastWords = lastText.split(/\s+/).slice(0, 20).join(' ');
        return newWords === lastWords;
    }

    for (const article of articles) {
        const roleEl = article.querySelector('[data-message-author-role]');
        const role = roleEl?.getAttribute('data-message-author-role');
        if (!role) continue;

        let rawHTML;
        if (role === "user") {
            rawHTML = article.querySelector(".whitespace-pre-wrap")?.innerHTML;
        } else if (role === "assistant") {
            rawHTML = article.querySelector(".markdown")?.innerHTML;
        }

        if (!rawHTML) continue;
        const content = h(rawHTML);
        if (!content) continue;

        if (role === "user" && !isDuplicate(content, lastPrompt)) {
            output += `Prompt #${promptCount}:\n${content}\n\n---\n\n`;
            lastPrompt = content;
            promptCount++;
        }

        if (role === "assistant" && !isDuplicate(content, lastResponse)) {
            output += `Response #${responseCount}:\n${content}\n\n---\n\n`;
            lastResponse = content;
            responseCount++;
        }
    }

    const link = document.createElement("a");
    link.download = `ChatGPT_Conversation_${new Date().toISOString().split('T')[0]}.md`;
    link.href = URL.createObjectURL(new Blob([output], { type: "text/markdown" }));
    link.style.display = "none";
    document.body.appendChild(link);
    link.click();
})();
```
