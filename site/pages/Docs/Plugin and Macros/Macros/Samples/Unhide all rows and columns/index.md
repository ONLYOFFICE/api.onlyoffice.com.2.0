---
order: -6
---

## Description

Unhides all the rows and columns in the active spreadsheet.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    var activeSheet = Api.ActiveSheet;
    var indexRowMax = 1048576;
    var n = 1;
    for (let i = 0; i < indexRowMax; i++) {
        activeSheet.GetRows(n).SetHidden(false);
        n++;
    }
    var newRange = activeSheet.GetRange("A1");
    newRange.SetValue("All the rows and columns are unhidden now");
})();
```

Methods used: GetActiveSheet, GetRows, SetHidden, GetRange, SetValue

## Result

![Unhide all rows](/assets/images/plugins/unhide-all-rows.png)
