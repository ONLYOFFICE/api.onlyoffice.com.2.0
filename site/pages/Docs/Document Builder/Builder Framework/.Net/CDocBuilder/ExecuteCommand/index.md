```yml signature
- {type: type, text: bool}
- {type: text, text: " "}
- {type: entity, text: ExecuteCommand}
- {type: text, text: (}
- {type: parameter, text: sCommand}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: ", "}
- {type: parameter, text: oRetValue}
- {type: text, text: ": "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue^%}}
- {type: text, text: " = "}
- {type: text, text: 0}
- {type: text, text: )}
```

## Description

Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md), or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which commands are available for various document types.

> Please note, that for the `.docbuilder` file the `CDocBuilder.ExecuteCommand` method is not used explicitly. The command itself is used instead. See the example below.

## Parameters

<parameters>

- sCommand

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - : The command in the form of JavaScript code which will be used to create the document file (in .Net, the escape character must be used when the command contains quotation symbols).

- oRetValue, default: 0

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue^%}}
  ```

  - : The command return value.

</parameters>

## Example

### .Net

``` cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Hello from .net!\");");
CDocBuilder.Destroy();
```

### .docbuilder

``` ts
oParagraph.AddText("Hello from .net!")
```
