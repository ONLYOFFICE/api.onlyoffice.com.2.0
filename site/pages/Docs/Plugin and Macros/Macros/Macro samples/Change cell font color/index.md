---
order: -17
---

## Description

Sets the font color of the cell **B4** to red.

``` javascript
(function()
{
    Api.GetActiveSheet().GetRange("B4").SetFontColor(Api.CreateColorFromRGB(255, 0, 0));
})();
```

Methods used: [GetActiveSheet](/officeapi/spreadsheetapi/api/getactivesheet), [GetRange](/officeapi/spreadsheetapi/apiworksheet/getrange), [SetFontColor](/officeapi/spreadsheetapi/apirange/setfontcolor)

## Reference Microsoft VBA macro code

``` javascript
Sub example()
    Range("B4").Font.Color = RGB(255, 0, 0)
End Sub
```

## Result

![Font color](/assets/images/plugins/font_color.png)
