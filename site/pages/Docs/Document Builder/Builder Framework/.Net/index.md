---
order: -3
---

For the integration of **ONLYOFFICE Document Builder** into any application, the .Net **doctrenderer** library is used. The current application version contains five main classes:

- *CDoctrenderer* class - used by **ONLYOFFICE Document Builder** in the file conversion process.
- [CDocBuilder](CDocBuilder/index.md) class - used by **ONLYOFFICE Document Builder** for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
- [CDocBuilderValue](CDocBuilderValue/index.md) class - used by **ONLYOFFICE Document Builder** for getting the results of called JS commands. It represents a wrapper for a JS object.
- [CDocBuilderContextScope](CDocBuilderContextScope/index.md) class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
- [CDocBuilderContext](CDocBuilderContext/index.md) class - used by **ONLYOFFICE Document Builder** for getting JS context for working.

## Example

### .Net

```cs
using docbuilder_net;

using OfficeFileTypes = docbuilder_net.FileTypes;
using CValue = docbuilder_net.CDocBuilderValue;
using CContext = docbuilder_net.CDocBuilderContext;
using CContextScope = docbuilder_net.CDocBuilderContextScope;

namespace Test
{
    public class Program
    {
        public static void Main(string[] args)
        {
            string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
            string resultPath = "result.docx";

            // add the Docbuilder dlls to the path
            System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);

            Test(workDirectory, resultPath);

            // uncomment these lines to check the finalizer calls
            // GC.Collect();
            // Console.ReadKey();
        }
        public static void Test(string workDirectory, string resultPath)
        {
            var doctype = (int)OfficeFileTypes.Document.DOCX;

            CDocBuilder.Initialize(workDirectory);
            CDocBuilder oBuilder = new CDocBuilder();
            oBuilder.SetProperty("--work-directory", workDirectory);
            oBuilder.CreateFile(doctype);

            CContext oContext = oBuilder.GetContext();
            CContextScope oScope = oContext.CreateScope();
          
            CValue oGlobal = oContext.GetGlobal();

            CValue oApi = oGlobal["Api"];
            CValue oDocument = oApi.Call("GetDocument");
            CValue oParagraph = oApi.Call("CreateParagraph");
            CValue oContent = oContext.CreateArray(1);

            oParagraph.Call("SetSpacingAfter", 1000, false);
            oParagraph.Call("AddText", "Hello from .net!");
            oContent[0] = oParagraph;
            oDocument.Call("InsertContent", oContent);

            oBuilder.SaveFile(doctype, resultPath);
            oBuilder.CloseFile();

            CDocBuilder.Destroy();
        }
    }
}
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
builder.CreateFile("docx")
const oDocument = Api.GetDocument()
const oParagraph = Api.CreateParagraph()
oParagraph.SetSpacingAfter(1000, false)
oParagraph.AddText("Hello from .net!")
oDocument.InsertContent([oParagraph])
builder.SaveFile("docx", "result.docx")
builder.CloseFile()
```
