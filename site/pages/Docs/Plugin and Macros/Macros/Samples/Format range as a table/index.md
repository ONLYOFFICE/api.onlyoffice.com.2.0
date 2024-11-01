---
order: -14
---

## Description

Formats the range of cells **A1:D10** as a table.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().FormatAsTable("A1:D10");
})();
```

Methods used: GetActiveSheet, FormatAsTable

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Sheet1.ListObjects.Add(xlSrcRange, Range("A1:D10"), , xlYes).Name = "myTable1"
End Sub
```

## Result

![Range as a table](/assets/images/plugins/range-as-a-table.png)
