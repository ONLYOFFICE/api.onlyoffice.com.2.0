---
order: -2
---

For the integration of **ONLYOFFICE Document Builder** into any application, the Python **doctrenderer** library is used. The current application version contains four main classes:

- [CDocBuilder](CDocBuilder/index.md) class - used by **ONLYOFFICE Document Builder** for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
- [CDocBuilderContext](CDocBuilderContext/index.md) class - used by **ONLYOFFICE Document Builder** for getting JS context for working.
- [CDocBuilderContextScope](CDocBuilderContextScope/index.md) class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
- [CDocBuilderValue](CDocBuilderValue/index.md) class - used by **ONLYOFFICE Document Builder** for getting the results of called JS commands. It represents a wrapper for a JS object.

## Example

### Python

``` py
import os
import sys
sys.path.append("C:/Program Files/ONLYOFFICE/DocumentBuilder")
import docbuilder

builder = docbuilder.CDocBuilder()

builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()

globalObj = context.GetGlobal()

api = globalObj["Api"]
document = api.Call("GetDocument")
paragraph = api.Call("CreateParagraph")
paragraph.Call("SetSpacingAfter", 1000, False)
paragraph.Call("AddText", "Hello, World!")
content = context.CreateArray(1)
content[0] = paragraph
document.Call("InsertContent", content)

dstPath = os.getcwd() + "/result.docx"
builder.SaveFile("docx", dstPath)
builder.CloseFile()
```

### .docbuilder

``` ts
builder.SetTmpFolder("DocBuilderTemp")
builder.CreateFile("docx")
const oDocument = Api.GetDocument()
const oParagraph = Api.CreateParagraph()
oParagraph.SetSpacingAfter(1000, false)
oParagraph.AddText("Hello, World!")
oDocument.InsertContent([oParagraph])
builder.SaveFile("docx", "result.docx")
builder.CloseFile()
```
