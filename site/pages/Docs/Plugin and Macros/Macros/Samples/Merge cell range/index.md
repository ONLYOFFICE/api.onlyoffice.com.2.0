---
order: -17
---

## Description

Merges the selected cell range.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().GetRange("A1:B3").Merge(true);
})();
```

Methods used: GetActiveSheet, GetRange, Merge

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Range("A1:B3").Merge
End Sub
```

## Result

![Merge cells](/assets/images/plugins/merge-cells.png)
