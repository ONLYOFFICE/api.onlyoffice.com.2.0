---
order: -18
---

## Description

Sets the font of the cell **A2** to bold.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().GetRange("A2").SetBold(true);
})();
```

Methods used: GetActiveSheet, GetRange, SetBold

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Range("A2").Font.Bold = True
End Sub
```

## Result

![Font bold](/assets/images/plugins/font-bold.png)
