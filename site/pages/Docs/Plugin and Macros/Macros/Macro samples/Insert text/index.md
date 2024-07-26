---
order: -8
---


## Description

Inserts text into the document at the current cursor position.

``` javascript
(function()
{
    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Hello world!");
    oDocument.InsertContent([oParagraph]);
})();
```

Methods used: [GetDocument](/officeapi/textdocumentapi/api/getdocument), [CreateParagraph](/officeapi/textdocumentapi/api/createparagraph), [AddText](/officeapi/textdocumentapi/apiparagraph/addtext), [InsertContent](/officeapi/textdocumentapi/apidocument/insertcontent)

## Result

![Chart](/assets/images/plugins/insert-text.png)
