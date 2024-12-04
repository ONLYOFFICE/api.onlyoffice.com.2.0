---
order: -4
---

## Description

Inserts a unique id into a form document.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    function generate () {
        let key = '';
        const data = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
                'abcdefghijklmnopqrstuvwxyz0123456789';
        for (let i = 1; i <= 12; i++) {
            let index = Math.floor(Math.random()
                        * data.length + 1);
            key += data.charAt(index);
        }
        return key;
    }
    const id = generate();
    const oDocument = Api.GetDocument();
    const oParagraph = Api.CreateParagraph();
    oParagraph.AddText(id);
    oDocument.InsertContent([oParagraph], { "KeepTextOnly": true });
})();
```

Methods used: GetDocument, CreateParagraph, AddText, InsertContent

## Result

![Insert id](/assets/images/plugins/insert-id.png)
