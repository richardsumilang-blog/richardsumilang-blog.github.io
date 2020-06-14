---
CoverImage: images/apps/ide/visual-studio-code/how-to-add-cursive/edtor-cursive-900x409.jpg
CoverImageType: image/jpg
CoverImageWidth: 900
CoverImageHeight: 409
Description: How to add cursive fonts to VS Code using Fira Code.
Categories:
 - Apps
Tags:
 - IDE
 - VS Code
 - Fira Code
Keywords:
 - IDE
 - VS Code
 - VS Code
Title: Add cursive fonts to VS Code
SubTitle: Fira Code
Date: "2020-06-14T02:47:57.417Z"
---

[1]: https://github.com/tonsky/FiraCode "Fira Code"
[2]: https://marketplace.visualstudio.com/items?itemName=idbartosz.darkpp-italic "Dark++ Italic"
[3]: https://code.visualstudio.com/ "Visual Studio Code - Code Editing"
[4]: https://github.com/kiliman/operator-mono-lig "Operator Mono Lig"


I have recently got into caligraphy and thought it would be neat to see cursive in my code editor as well. A quick google and I found a [monospaced cursive font with ligatures][1]! (Ligatures are basically symbols that replace pieces of code like `!==` to single looking character.) It's really nice and makes some things very easy to read on top of making the coding experience a little more fun.

To get started...

+ You'll first need to download [Fira Code][1] fonts and install them.
+ Install and apply [Dark++ Italic][2] theme.
+ Open your [VS Code][3] `settings.json` file and add the following lines:

<pre><code class="language-javascript" title="settings.json" >{
    "editor.fontFamily": "Fira Code iScript, Menlo, Monaco, 'Courier New', monospace",
    "editor.fontLigatures": true,
}</code></pre>

<!--more-->

You could be done at this point if you are fine with the Dark++ Italic theme colors. Or you could add these additional settings to your `settings.json` to override any themes' font configuration:

*Note:* I added a some additional _italics_ that Dark++ Italic didn't have, like `comment`.

<pre><code class="language-javascript" title="settings.json">{
    "editor.tokenColorCustomizations": {
        "textMateRules": [
            {
                "name": "comment",
                "scope": [
                    "comment"
                ],
                "settings": {
                    "fontStyle": "italic"
                }
            },
            {
                "name": "Keyword Storage",
                "scope": [
                    "keyword",
                    "keyword.control",
                    "storage"
                ],
                "settings": {
                    "fontStyle": "italic"
                }
            },
            {
                "name": "Entity",
                "scope": [
                    "entity.name.method",
                    "entity.name.type.class",
                    "entity.other.attribute-name"
                ],
                "settings": {
                    "fontStyle": "italic"
                }
            },
            {
                "name": "Variable",
                "scope": [
                    "variable.language"
                ],
                "settings": {
                    "fontStyle": "italic"
                }
            }
        ]
    }
}</code></pre>

### Conclusion

While taking notes can sometimes seem boring, it can be fun with a nice pen, some ink, and the right notepad. Adding Dark++ Italic and Fira Code does that to my IDE. There are also other monospaced cursive fonts out there like [Operator Mono Lig][4], for example. Try some out and see what works for you. Have fun.