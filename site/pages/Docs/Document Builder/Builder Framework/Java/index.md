---
order: -4
---

For the integration of **ONLYOFFICE Document Builder** into any application, the Java **doctrenderer** library is used. The current application version contains five main classes:

- [CDocBuilder](CDocBuilder/index.md) class - used by **ONLYOFFICE Document Builder** for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
- [CDocBuilderValue](CDocBuilderValue/index.md) class - used by **ONLYOFFICE Document Builder** for getting the results of called JS commands. It represents a wrapper for a JS object.
- [CDocBuilderContextScope](CDocBuilderContextScope/index.md) class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
- [CDocBuilderContext](CDocBuilderContext/index.md) class - used by **ONLYOFFICE Document Builder** for getting JS context for working.

> JDK 8 and above is supported.

## Example

### Java

``` java
import docbuilder.*;

public class Program {
    public static void main(String[] args) {
        String resultPath = "result.docx";

        test(resultPath);

        System.gc();
    }

    public static void test(String resultPath) {
        CDocBuilder.initialize("");
        CDocBuilder builder = new CDocBuilder();
        builder.createFile(FileTypes.Document.DOCX);

        CDocBuilderContext context = builder.getContext();

        CDocBuilderValue global = context.getGlobal();

        CDocBuilderValue api = global.get("Api");
        CDocBuilderValue document = api.call("GetDocument");
        CDocBuilderValue paragraph1 = api.call("CreateParagraph");

        paragraph1.call("SetSpacingAfter", 1000, false);
        paragraph1.call("AddText", "Hello from Java!");

        CDocBuilderValue paragraph2 = api.call("CreateParagraph");
        paragraph2.call("AddText", "Goodbye!");

        CDocBuilderValue[] paragraphs = { paragraph1, paragraph2 };
        CDocBuilderValue content = new CDocBuilderValue(paragraphs);

        document.call("InsertContent", content);

        builder.saveFile(FileTypes.Document.DOCX, resultPath);
        builder.closeFile();

        CDocBuilder.dispose();
    }
}
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
builder.CreateFile("docx")
const oDocument = Api.GetDocument()
const oParagraph1 = Api.CreateParagraph()
oParagraph1.SetSpacingAfter(1000, false)
oParagraph1.AddText("Hello from Java!")
const oParagraph2 = Api.CreateParagraph()
oParagraph2.AddText("Goodbye!")
const aParagraphs = [oParagraph1, oParagraph2]
oDocument.InsertContent(aParagraphs)
builder.SaveFile("docx", "result.docx")
builder.CloseFile()
```
