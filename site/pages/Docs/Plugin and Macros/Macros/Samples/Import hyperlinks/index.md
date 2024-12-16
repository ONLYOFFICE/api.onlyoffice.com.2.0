---
order: 
---

## Description

Import hyperlinks between different worksheets in the spreadsheet.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

```ts
var oWorksheetA = Api.GetSheet("Sheet1");
var oWorksheetB = Api.GetSheet("Sheet2");
var rowIndex = 0;
var titles = [];
var links = [];
while (rowIndex < 10) {
    var titleCell = oWorksheetA.GetRangeByNumber(rowIndex, 0); // Assuming title is in column A
    var linkCell = oWorksheetA.GetRangeByNumber(rowIndex, 1); // Assuming link is in column B
    var title = titleCell.GetValue();
    var link = linkCell.GetValue();
    titles.push(title); // Store titles in an array
    links.push(link);   // Store links in an array
    rowIndex++; // Increment the row index for the next iteration
}
var rangeB = Api.GetSelection();
rangeB.ForEach(function (cell) {
    var cellValue = cell.GetValue();
    // Check if the cell value matches any of the titles from the array
    var index = titles.indexOf(cellValue);
    if (index !== -1) {
        var title = titles[index];
        var link = links[index];
        var address = cell.GetAddress(true, true, "xlA1", false);
        // Set the hyperlink in oWorksheetB
        oWorksheetB.SetHyperlink(address, link, "Your Description", title);
    }
})
```

Methods used: GetSheet, GetRangeByNumber, GetValue, GetSelection, ForEach, GetAddress, SetHyperlink

## Reference Microsoft VBA macro code

<!-- code generated with AI -->

```vb
```

## Result

<!-- imgpath -->

![Import hyperlinks](/assets/images/plugins/import-hyperlinks.png)
