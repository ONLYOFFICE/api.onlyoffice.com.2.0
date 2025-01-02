---
order:
---

## Description

Generates word definitions in your document using the [Dictionary API](https://api-ninjas.com/api/dictionary) offered by [API Ninjas](https://api-ninjas.com).

> To use this macro, you need to obtain your own API key from API Ninjas.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

```ts
(function () {
  const oDocument = Api.GetDocument();
  const oRange = oDocument.GetRangeBySelect();
  const word = oRange.GetText();
  $.ajax({
    method: "GET",
    url: "https://api.api-ninjas.com/v1/dictionary?word=" + word,
    headers: { "X-Api-Key": "your-api-key" },
    contentType: "application/json",
    success: function (result) {
      console.log(result);
      const text = result.definition;
      const oParagraph = Api.CreateParagraph();
      oParagraph.AddText(text);
      oDocument.InsertContent([oParagraph], { KeepTextOnly: true });
    },
    error: function ajaxError(jqXHR) {
      console.error("Error: ", jqXHR.responseText);
    },
  });
})();
```

Methods used: GetDocument, GetRangeBySelect, GetText, CreateParagraph, AddText, InsertContent

## Result

<!-- imgpath -->

![Generate word definitons](/assets/images/plugins/generate-word-definitions.png)
