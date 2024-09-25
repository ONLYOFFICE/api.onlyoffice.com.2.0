---
order: -2
---

If you need to pass some arguments to the created document using the command line, you can do that with **Document Builder**. To do that you will need to modify the code of your **.docbuilder** script file and include the arguments you need into the command running **Document Builder**.

> This is the same as using the [SetProperty](../../Builder%20Framework/C++/CDocBuilder/SetProperty/index.md) method.

In this case the command will look like this:

```sh
docbuilder.exe "--argument={\"company\":\"ONLYOFFICE\",\"product\":\"ONLYOFFICE Document Builder\",\"compatibility\":\"100%\"}" "path-to-file\sample_with_arguments.docbuilder"
```

The sample code for the **.docbuilder** script file can be like this:

## Example

``` ts
builder.CreateFile("docx")
const sCompany = Argument["company"]
const sProduct = Argument["product"]
const sCompatibility = Argument["compatibility"]
const oDocument = Api.GetDocument()
const oParagraph = oDocument.GetElement(0)
oParagraph.AddText("This is an example of using command line arguments with ONLYOFFICE Document Builder.")
oParagraph.AddLineBreak()
oParagraph.AddLineBreak()
oParagraph.AddText(`Company name: ${sCompany}`)
oParagraph.AddLineBreak()
oParagraph.AddText(`Product:  ${sProduct}`)
oParagraph.AddLineBreak()
oParagraph.AddText(`Compatibility with OOXML standards: ${sCompatibility}`)
builder.SaveFile("docx", "ArgumentUse.docx")
builder.CloseFile()
```
