---
order: -19
---

## Description

Sets the font color of the cell **B4** to red.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().GetRange("B4").SetFontColor(Api.CreateColorFromRGB(255, 0, 0));
})();
```

Methods used: GetActiveSheet, GetRange, SetFontColor

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Range("B4").Font.Color = RGB(255, 0, 0)
End Sub
```

## Result

![Font color](/assets/images/plugins/font-color.png)
