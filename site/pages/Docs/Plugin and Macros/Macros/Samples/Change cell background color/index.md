---
order: -20
---

## Description

Sets the background color of the cell **B3** to blue.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
    Api.GetActiveSheet().GetRange("B3").SetFillColor(Api.CreateColorFromRGB(0, 0, 250));
})();
```

Methods used: GetActiveSheet, GetRange, SetFillColor, CreateColorFromRGB

## Reference Microsoft VBA macro code

``` vb
Sub example()
    Range("B3").Interior.Color = RGB(0, 0, 250)
End Sub
```

## Result

![Background color](/assets/images/plugins/background-color.png)
