---
order: -15
---

## Description

Sets the width for the column **B**.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().SetColumnWidth(1, 25);
})();
```

Methods used: GetActiveSheet, SetColumnWidth

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Columns("B").ColumnWidth = 25
End Sub
```

## Result

![Column width](/assets/images/plugins/column-width.png)
