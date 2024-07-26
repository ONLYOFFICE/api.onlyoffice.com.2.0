---
order: -16
---

## Description

Sets the font of the cell **A2** to bold.

``` javascript
(function()
{
    Api.GetActiveSheet().GetRange("A2").SetBold(true);
})();
```

Methods used: [GetActiveSheet](/officeapi/spreadsheetapi/api/getactivesheet), [GetRange](/officeapi/spreadsheetapi/apiworksheet/getrange), [SetBold](/officeapi/spreadsheetapi/apirange/setbold)

## Reference Microsoft VBA macro code

``` javascript
Sub example()
    Range("A2").Font.Bold = True
End Sub
```

## Result

![Font bold](/assets/images/plugins/font_bold.png)
