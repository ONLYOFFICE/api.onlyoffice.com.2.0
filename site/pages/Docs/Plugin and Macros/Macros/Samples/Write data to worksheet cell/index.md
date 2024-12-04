---
order: -21
---

## Description

Writes the data (the *Hello world* phrase) to the worksheet third column of the fourth row.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
  Api.GetActiveSheet().GetRange("C4").SetValue("Hello world");
})();
```

Methods used: GetActiveSheet, GetRange, SetValue

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Cells(3, 4)="Hello world"
End Sub
```

## Result

![Write data](/assets/images/plugins/write-data-to-cell.png)
