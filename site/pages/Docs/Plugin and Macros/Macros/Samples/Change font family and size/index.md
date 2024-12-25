---
order:
---

## Description

Changes the font family and/or size on all the slides in your presentation.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

```ts
(function () {
  var oPresentation = Api.GetPresentation();
  for (
    var slideIndex = 0;
    slideIndex < oPresentation.GetSlidesCount();
    slideIndex++
  ) {
    var oSlide = oPresentation.GetSlideByIndex(slideIndex);
    var aShape = oSlide.GetAllShapes();

    for (var shapeIndex = 0; shapeIndex < aShape.length; shapeIndex++) {
      var content = aShape[shapeIndex].GetDocContent();
      // Check if content is valid before proceeding
      if (content) {
        var count = content.GetElementsCount();
        for (var elementIndex = 0; elementIndex < count; elementIndex++) {
          var element = content.GetElement(elementIndex);
          // Check if element is valid before using it
          if (element) {
            element.SetFontSize(10);
            element.SetFontFamily("Comic Sans");
          }
        }
      }
    }
  }
})();
```

Methods used: GetPresentation, GetSlidesCount, GetSlideByIndex, GetAllShapes, GetDocContent, GetElementsCount, GetElement, SetFontSize, SetFontFamily

## Reference Microsoft VBA macro code

<!-- code generated with AI -->

```vb
Sub ChangeFontOnAllSlides()
    Dim slide As slide
    Dim shape As shape

    ' Loop through each slide in the presentation
    For Each slide In ActivePresentation.Slides
        ' Loop through each shape on the slide
        For Each shape In slide.Shapes
            ' Check if the shape has text
            If shape.HasTextFrame Then
                If shape.TextFrame.HasText Then
                    With shape.TextFrame.TextRange
                        .Font.Name = "Arial"
                        .Font.Size = 20
                    End With
                End If
            End If
        Next shape
    Next slide

    MsgBox "Font updated on all slides!", vbInformation
End Sub
```

## Result

<!-- imgpath -->

![Change font family and size](/assets/images/plugins/change-font-family-and-size.png)
