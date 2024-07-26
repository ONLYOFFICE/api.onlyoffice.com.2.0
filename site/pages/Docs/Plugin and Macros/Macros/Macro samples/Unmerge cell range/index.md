---
order: -14
---

## Description

Unmerges the selected cell range.

``` javascript
(function()
{
    Api.GetActiveSheet().GetRange("C5:D10").UnMerge();
})();
```

Methods used: [GetActiveSheet](/officeapi/spreadsheetapi/api/getactivesheet), [GetRange](/officeapi/spreadsheetapi/apiworksheet/getrange), [UnMerge](/officeapi/spreadsheetapi/apirange/unmerge)

## Reference Microsoft VBA macro code

``` javascript
Sub example()
    Range("C5:D10").UnMerge
End Sub
```

## Result

![Unmerge-before](/assets/images/plugins/unmerge_cells_before.png) ![Unmerge-after](/assets/images/plugins/unmerge_cells_after.png)
