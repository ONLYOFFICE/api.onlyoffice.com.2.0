---
order: -5
---

## Description

Removes shapes from slides in a presentation.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

``` ts
(function()
{
  var oPresentation = Api.GetPresentation();
  for (let i = 0; i < 10; i++) {
    var oSlide = oPresentation.GetSlideByIndex(i);
    var aShape  = oSlide.GetAllShapes();
    aShape[0].Delete();
  }
})();
```

Methods used: GetPresentation, GetSlideByIndex, GetAllShapes

## Result

![Next blank row](/assets/images/plugins/remove-shapes.png)
