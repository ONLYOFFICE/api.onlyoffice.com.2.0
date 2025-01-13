---
order: 
---

## Description

Hides or unhides the specified rows and/or columns in the spreadsheet.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

```ts
(function()
{
    const sheet = Api.GetActiveSheet()
    const range = sheet.GetRange("A1:M1")
    const rowsToHide = [5, 8, 9, 12, 14, 16, 21, 22, 31, 32, 33]
    const columnsToHide = [2,4,5,7,8,10,11,13,14,16]
    const hidden = sheet.GetRows(rowsToHide[0]).GetHidden()
    hideUnhideDetails(hidden)
    // Unhide if hidden, Hide if unhidden
    function hideUnhideDetails(hidden) {
        rowsToHide.forEach(row => {
            sheet.GetRows(row).SetHidden(!hidden)
        })
        columnsToHide.forEach(column => {
            range.GetCols(column).SetHidden(!hidden)
        })
    }
})();
```

Methods used: GetActiveSheet, GetRange, GetRows, GetHidden, GetCols, SetHidden

## Reference Microsoft VBA macro code

<!-- code generated with AI -->

```vb
Sub HideUnhide()
    Rows("5:10").Hidden = Not Rows("5:10").Hidden
    Columns("B:D").Hidden = Not Columns("B:D").Hidden
End Sub
```

## Result

<!-- imgpath -->

![Hide or unhide rows and columns](/assets/images/plugins/hide-unhide-rows-columns.png)
