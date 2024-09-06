Create a presentation on a specific topic:


* create the necessary number of slides in the current presentation (Api/CreateSlide, Api/GetPresentation, ApiPresentation/AddSlide, ApiPresentation/GetSlideByIndex);
* set the presentation sizes (ApiPresentation/SetSizes);
* set the background to each slide (Api/CreateBlipFill, ApiSlide/SetBackground);
* set the slide title and text in the specified style (Api/CreateParagraph, Api/CreateRGBColor, Api/CreateShape, Api/CreateSolidFill, ApiDocumentContent/RemoveAllElements ApiDocumentContent/Push, ApiDrawing/SetPosition, ApiParagraph/AddText, ApiParagraph/SetJc, ApiParagraph/SetSpacingAfter, ApiParagraph/SetSpacingBefore, ApiRun/SetBold, ApiRun/SetFill, ApiRun/SetFontFamily, ApiRun/SetFontSize, ApiShape/GetDocContent, ApiSlide/AddObject, ApiSlide/RemoveAllObjects).

This sample is available for the **C++ and .Net DocBuilder Frameworks**.
Download the sample and get more information on the [Builder framework samples](../../../../Document%20Builder/Builder%20Framework/Builder%20framework%20samples/index.md) page.

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.CreateFile("pptx")
const oPresentation = Api.GetPresentation()
oPresentation.SetSizes(9_144_000, 6_858_000)

function createSlide(oPresentation, image_url) {
  const oSlide = Api.CreateSlide()
  oPresentation.AddSlide(oSlide)
  const oFill = Api.CreateBlipFill(image_url, "stretch")
  oSlide.SetBackground(oFill)
  oSlide.RemoveAllObjects()
  return oSlide
}

function addText(oShape, oContent, text, fontSize, isBold, js) {
  const oParagraph = Api.CreateParagraph()
  oParagraph.SetSpacingBefore(0)
  oParagraph.SetSpacingAfter(0)
  oContent.Push(oParagraph)
  const oRun = oParagraph.AddText(text)
  oRun.SetFill(Api.CreateSolidFill(Api.CreateRGBColor(0xFF, 0xFF, 0xFF)))
  oRun.SetFontSize(fontSize)
  oRun.SetFontFamily("Georgia")
  oRun.SetBold(isBold)
  oParagraph.SetJc(js)
}

const image_url = "https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_gun.png"
let oSlide = createSlide(oPresentation, image_url)
oPresentation.GetSlideByIndex(0).Delete()

let oShape = Api.CreateShape("rect", 8_056_800, 3_020_400, Api.CreateNoFill(), Api.CreateStroke(0, Api.CreateNoFill()))
oShape.SetPosition(608_400, 1_267_200)
let oContent = oShape.GetDocContent()
oContent.RemoveAllElements()
addText(oShape, oContent, "How They", 160, true, "left")
addText(oShape, oContent, "Throw Out", 132, false, "left")
addText(oShape, oContent, "a Challenge", 132, false, "left")
oSlide.AddObject(oShape)

oSlide = Api.CreateSlide()
oPresentation.AddSlide(oSlide)
let oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_axe.png", "stretch")
oSlide.SetBackground(oFill)
oSlide.RemoveAllObjects()

oShape = Api.CreateShape("rect", 6_904_800, 1_724_400, Api.CreateNoFill(), Api.CreateStroke(0, Api.CreateNoFill()))
oShape.SetPosition(1_764_000, 1_191_600)
oContent = oShape.GetDocContent()
oContent.RemoveAllElements()
addText(oShape, oContent, "American Indians ", 110, true, "right")
addText(oShape, oContent, "(XVII century)", 94, false, "right")
oSlide.AddObject(oShape)

oShape = Api.CreateShape("rect", 4_986_000, 2_419_200, Api.CreateNoFill(), Api.CreateStroke(0, Api.CreateNoFill()))
oShape.SetPosition(3_834_000, 3_888_000)
oContent = oShape.GetDocContent()
oContent.RemoveAllElements()
addText(oShape, oContent, "put a tomahawk on the ground in the ", 84, false, "right")
addText(oShape, oContent, "rival's camp", 84, false, "right")
oSlide.AddObject(oShape)

oSlide = Api.CreateSlide()
oPresentation.AddSlide(oSlide)
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_knight.png", "stretch")
oSlide.SetBackground(oFill)
oSlide.RemoveAllObjects()

oShape = Api.CreateShape("rect", 6_904_800, 1_724_400, Api.CreateNoFill(), Api.CreateStroke(0, Api.CreateNoFill()))
oShape.SetPosition(1_764_000, 1_191_600)
oContent = oShape.GetDocContent()
oContent.RemoveAllElements()
addText(oShape, oContent, "European Knights", 110, true, "right")
addText(oShape, oContent, " (XII-XVI centuries)", 94, false, "right")
oSlide.AddObject(oShape)

oShape = Api.CreateShape("rect", 4_986_000, 2_419_200, Api.CreateNoFill(), Api.CreateStroke(0, Api.CreateNoFill()))
oShape.SetPosition(3_834_000, 3_888_000)
oContent = oShape.GetDocContent()
oContent.RemoveAllElements()
addText(oShape, oContent, "threw a glove", 84, false, "right")
addText(oShape, oContent, "in the rival's face", 84, false, "right")
oSlide.AddObject(oShape)

oSlide = Api.CreateSlide()
oPresentation.AddSlide(oSlide)
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_sky.png", "stretch")
oSlide.SetBackground(oFill)
oSlide.RemoveAllObjects()

oShape = Api.CreateShape("rect", 7_887_600, 3_063_600, Api.CreateNoFill(), Api.CreateStroke(0, Api.CreateNoFill()))
oShape.SetPosition(630_000, 1_357_200)
oContent = oShape.GetDocContent()
oContent.RemoveAllElements()
addText(oShape, oContent, "ONLYOFFICE", 176, false, "center")
addText(oShape, oContent, "stands for Peace", 132, false, "center")
oSlide.AddObject(oShape)

builder.SaveFile("pptx", "Presentation.pptx")
builder.CloseFile()
```