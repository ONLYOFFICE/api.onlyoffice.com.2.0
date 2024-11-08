---
order: -10
---

## Description

Inserts text into the document at the current cursor position.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Hello world!");
    oDocument.InsertContent([oParagraph]);
})();
```

Methods used: GetDocument, CreateParagraph, AddText, InsertContent

## Result

![Chart](/assets/images/plugins/macro-window.png)
