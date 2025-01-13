```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: RunText}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: commands}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: )}
```

## Description

Runs all the commands for the document creation using a single command. Compared to [CDocBuilder.ExecuteCommand](../ExecuteCommand/index.md) where only one command at a time is allowed, `CDocBuilder.RunText` makes it possible to enter all the commands for the document creation at once.

> Please note, that for the `.docbuilder` file the `CDocBuilder.RunText` method is not used.

## Parameters

<parameters>

- commands

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The commands which will be used to create the document file (in Python, the escape character must be used when the command contains quotation symbols). All the commands containing `builder.` are line separated, i.e. you cannot write them in one line, each command must start with its own line.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.RunText(L"builder.SetTmpFolder(\"DocBuilderTemp\");\n\
builder.CreateFile(\"docx\");\n\
var oDocument = Api.GetDocument();var oParagraph;oParagraph = oDocument.GetElement(0);oParagraph.SetJc(\"center\");oParagraph.AddText(\"Center\");\n\
builder.SaveFile(\"pdf\", \"images.pdf\");\n\
builder.CloseFile();")
```
