---
order: -16
---

## Description

Unmerges the selected cell range.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().GetRange("C5:D10").UnMerge();
})();
```

Methods used: GetActiveSheet, GetRange, UnMerge

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Range("C5:D10").UnMerge
End Sub
```

## Result

![Unmerge-before](/assets/images/plugins/unmerge-cells-before.png) ![Unmerge-after](/assets/images/plugins/unmerge-cells-after.png)
