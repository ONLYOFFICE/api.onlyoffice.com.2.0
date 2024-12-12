---
order: -2
---

To call commands and send the data back to the editor, define the **callCommand** method. It allows the plugin to send structured data that can be inserted to the resulting document file (formatted paragraphs, tables, text parts, and separate words, etc.).

*The callback is* the result that the command returns. It is an optional parameter. In case it is missing, the *window.Asc.plugin.onCommandCallback* function will be used to return the result of the command execution.

> **Office JavaScript API** commands can be only used to create content and insert it to the document editor (using the *Api.GetDocument().InsertContent(...)*). This limitation exists due to the co-editing feature in the online editors. If it is necessary to create a plugin for desktop editors to work with local files, no such limitation is applied.

## callCommand

### Parameters

#### func

Defines the command written in JavaScript which purpose is to form structured data which can be inserted to the resulting document file (formatted paragraphs, tables, text parts, and separate words, etc.). Then the data is sent to the editors. The command must be compatible with [Office JavaScript API](../../../../Office%20API/Get%20Started/Overview/index.md) syntax.

Type: function

#### isClose

Defines whether the plugin window must be closed after the code is executed or left open waiting for another command or action. The *true* value is used to close the plugin window after executing the function in the *func* parameter. The *false* value is used to execute the command and leave the window open waiting for the next command. The default value is *false*.

Type: boolean

#### isCalc

Defines whether the document will be recalculated or not. The *true* value is used to recalculate the document after executing the function in the *func* parameter. The *false* value will not recalculate the document (use it only when your edits surely will not require document recalculation). The default value is *true*.

Type: boolean

#### callback

The result that the method returns. Only the js standart types are available (any objects will be replaced *with undefined*).

Type: function

### Returns:

This method doesn't return any data.

### Example:

``` ts
Asc.plugin.callCommand(() => {
  const oDocument = Api.GetDocument()
  const oParagraph = Api.CreateParagraph()
  oParagraph.AddText("Hello world")
  oDocument.InsertContent([oParagraph])
}, true, true, (returnValue) => {})
```

## Asc.scope object

This method is executed in its own context isolated from other JavaScript data. If some parameters or any additional data (objects, parameters, variables, etc.)  need to be passed to this method, use **Asc.scope** object.

> The functions cannot be passed to the *callCommand* method using the *Asc.scope* object

### Example:

``` ts
Asc.scope.text = text
Asc.plugin.callCommand(() => {
  const oDocument = Api.GetDocument()
  const oParagraph = Api.CreateParagraph()
  oParagraph.AddText(Asc.scope.text)
  oDocument.InsertContent([oParagraph])
}, true, true, (returnValue) => {})
```

## info object

This object is used to change the object data and to send additional parameters when executing the **callCommand** method. The **info** object is the auxiliary object which is available when the plugin works. It stores all the information about the editor that uses the plugin (the used [editorType](#editortype) - text documents, spreadsheets, presentations) and additional settings for OLE objects (their width, height, millimeter to pixel ratio for the OLE objects vector drawing and some other OLE object parameters).

For example, if the document content is changed and recalculation is needed, the parameter [recalculate](#recalculate) must be set to *true*. This action is necessary because the recalculation process is asynchronous. Moreover, some other data might need to be uploaded (e.g. a font or something else).

See the available *window.Asc.plugin.info* object parameters below to find out more about them.

### Parameters

#### data

The OLE object data which need to be sent to the *window.Asc.plugin.info* object and used by the plugin.

Type: string

Example: "{data}"

#### editorType

The editor type where the plugin is currently running.

Type: string

Example: "word"

#### guid

The OLE object GUID in the current document.

Type: string

Example: "asc.{UUID}"

#### height

The OLE object height measured in millimeters.

Type: number

Example: 70

#### imgSrc

The link to the image (its visual representation) stored in the OLE object and used by the plugin.

Type: string

Example: "./resources/image.png"

#### mmToPx

Millimeter to pixel conversion ratio for the OLE object vector draw.

Type: number

Example: 3

#### objectId

The OLE object identifier in the current document.

Type: string

Example: "1"

#### recalculate

Forces the document to recalculate its content data.

Type: boolean

Example: true

#### resize

Checks if the OLE object size has been changed.

Type: boolean

Example: true

#### width

The OLE object width measured in millimeters.

Type: number

Example: 70

### Example for the data, height, imgSrc, mmToPx, objectId and width parameters

``` ts
window.Asc.plugin.button = (id) => {
  const info = window.Asc.plugin.info

  if (info.objectId === undefined) {
    const method = "asc_addOleObject"
  } else {
    const method = "asc_editOleObject"
  }

  if (info.width) {
    continue
  } else {
    info.width = 70
  }

  if (info.height) {
    continue
  } else {
    info.height = 70
  }

  if (info.height) {
    continue
  } else {
    info.height = 70
  }

  info.widthPix = Math.trunc(info.mmToPx * info.width)
  info.heightPix = Math.trunc(info.mmToPx * info.height)
  info.imgSrc = window.g_board.getResult(info.widthPix, info.heightPix).image
  info.data = window.g_board.getData()
  const code = `Api.${method}(${JSON.stringify(info)});`
  this.callCommand("close", code)
}
```

### Example for the editorType parameter

``` ts
function createScriptFromArray(aSelected) {
  if (aSelected.length !== 0) {
    switch (window.Asc.plugin.info.editorType) {
    case "word": {
      let sScript = "var oDocument = Api.GetDocument();"
      sScript = `${sScript}\noDocument.CreateNewHistoryPoint();`
      sScript = `${sScript}\nvar oParagraph, oRun, arrInsertResult = [], oImage;`
      sScript = `${sScript}\noDocument.InsertContent(arrInsertResult);`
      break
    }
    }
  }
  return sScript
}
```

### Example for the guid parameter

``` ts
window.Asc.plugin.init = () => {
  const plugin_uuid = window.Asc.plugin.info.guid
}
```

### Example for the recalculate parameter

``` ts
window.Asc.plugin.init = () => {
  let sScript = "var oDocument = Api.GetDocument();"
  sScript = `${sScript}\noDocument.CreateNewHistoryPoint();`
  sScript = `${sScript}\noParagraph = Api.CreateParagraph();`
  sScript = `${sScript}\noParagraph.AddText('Hello word!');`
  sScript = `${sScript}\noDocument.InsertContent([oParagraph]);`
  window.Asc.plugin.info.recalculate = true
  this.callCommand("close", sScript)
}
```

### Example for the resize parameter

``` ts
if (window.Asc.plugin.info.resize === true) {
  window.Asc.plugin.button(0)
}
```
