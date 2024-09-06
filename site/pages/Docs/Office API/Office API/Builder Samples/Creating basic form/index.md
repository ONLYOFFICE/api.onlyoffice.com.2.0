Create a basic form with the image and text inputs:

* create a new document, add text to the first paragraph and style it as heading (ApiDocument, ApiStyle, ApiParagraph);
* create an image form and a text form, and add the form to the document (Api/CreatePictureForm, Api/CreateTextForm).

This sample is available for the **C++ and .Net DocBuilder Frameworks**.
Download the sample and get more information on the [Builder framework samples](../../../../Document%20Builder/Builder%20Framework/Builder%20framework%20samples/index.md) page.

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.CreateFile("pdf")
const oDocument = Api.GetDocument()
let oParagraph = oDocument.GetElement(0)
const oHeadingStyle = oDocument.GetStyle("Heading 3")
oParagraph.AddText("Employee pass card")
oParagraph.SetStyle(oHeadingStyle)

const oPictureForm = Api.CreatePictureForm({
  key: "Photo",
  tip: "Upload your photo",
  required: false,
  placeholder: "Photo",
  scaleFlag: "tooBig",
  lockAspectRatio: true,
  respectBorders: false,
  shiftX: 50,
  shiftY: 50,
})
oParagraph = Api.CreateParagraph()
oParagraph.AddElement(oPictureForm)
oDocument.Push(oParagraph)

oParagraph = Api.CreateParagraph()
const oTextForm = Api.CreateTextForm({
  key: "First name",
  tip: "Enter your first name",
  required: false,
  placeholder: "First name",
  comb: true,
  maxCharacters: 13,
  cellWidth: 3,
  multiLine: false,
  autoFit: false,
})
oParagraph.AddElement(oTextForm)
oPictureForm.SetImage("https://api.onlyoffice.com/content/img/docbuilder/examples/user-profile.png")
oDocument.Push(oParagraph)

Api.Save()
builder.SaveFile("pdf", "PassCard.pdf")
builder.CloseFile()
```