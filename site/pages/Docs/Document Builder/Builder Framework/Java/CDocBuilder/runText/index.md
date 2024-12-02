```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: runText}
- {type: text, text: (}
- {type: parameter, text: commands}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: )}
```

## Description

Runs all the commands for the document creation using a single command. Compared to [CDocBuilder.executeCommand](../executeCommand/index.md) where only one command at a time is allowed, `CDocBuilder.runText` makes it possible to enter all the commands for the document creation at once.

> Please note, that for the `.docbuilder` file the `CDocBuilder.runText` method is not used.

## Parameters

<parameters>

- commands

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The commands which will be used to create the document file (in Java, the escape character must be used when the command contains quotation symbols). All the commands containing `builder.` are line separated, i.e. you cannot write them in one line, each command must start with its own line.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.runText(L"builder.SetTmpFolder(\"DocBuilderTemp\");\n\
builder.CreateFile(\"docx\");\n\
var oDocument = Api.GetDocument();var oParagraph;oParagraph = oDocument.GetElement(0);oParagraph.SetJc(\"center\");oParagraph.AddText(\"Center\");\n\
builder.SaveFile(\"pdf\", \"images.pdf\");\n\
builder.CloseFile();");
CDocBuilder.dispose();
```
