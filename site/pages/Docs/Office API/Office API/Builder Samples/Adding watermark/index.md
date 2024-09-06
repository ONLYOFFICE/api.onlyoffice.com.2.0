Create a document with a watermark with custom settings:

* create an empty page with a watermark (Api, ApiDocument/InsertWatermark);
* edit watermark settings, set an image, specify size, direction and opacity (ApiWatermarkSettings);

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.CreateFile("docx")
const oDocument = Api.GetDocument()
oDocument.InsertWatermark("Watermark", true)
const oSettings = oDocument.GetWatermarkSettings()
oSettings.SetType("image")
oSettings.SetImageURL("https://api.onlyoffice.com/content/img/docbuilder/examples/onlyoffice_logo.png")
oSettings.SetImageSize(40 * 36_000, 40 * 36_000)
oSettings.SetDirection("horizontal")
oSettings.SetOpacity(100)
oDocument.SetWatermarkSettings(oSettings)
builder.SaveFile("docx", "Watermark.docx")
builder.CloseFile()
```