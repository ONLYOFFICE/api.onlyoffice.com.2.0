Create a document with a watermark with custom settings:

- create an empty page with a watermark (Api, ApiDocument/InsertWatermark);
- edit watermark settings, set an image, specify size, direction and opacity (ApiWatermarkSettings);

```ts document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
const oDocument = Api.GetDocument()
oDocument.InsertWatermark("Watermark", true)
const oSettings = oDocument.GetWatermarkSettings()
oSettings.SetType("image")
oSettings.SetImageURL("https://static.onlyoffice.com/assets/docs/samples/img/onlyoffice_logo.png")
oSettings.SetImageSize(40 * 36_000, 40 * 36_000)
oSettings.SetDirection("horizontal")
oSettings.SetOpacity(100)
oDocument.SetWatermarkSettings(oSettings)
```
