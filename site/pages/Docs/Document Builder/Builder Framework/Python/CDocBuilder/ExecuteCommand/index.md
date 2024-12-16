```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: ExecuteCommand}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: command}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: ", "}
- {type: parameter, text: retValue}
- {type: text, text: ": "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " | "}
- {type: type, text: None}
- {type: text, text: " = "}
- {type: type, text: None}
- {type: text, text: )}
```

## Description

Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md), or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which commands are available for various document types.

> Please note, that for the `.docbuilder` file the `CDocBuilder.ExecuteCommand` method is not used explicitly. The command itself is used instead. See the example below.

## Parameters

<parameters>

- command

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The command in the form of JavaScript code which will be used to create the document file (in Python, the escape character must be used when the command contains quotation symbols).

- retValue, default: None

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
  - {type: text, text: " | "}
  - {type: type, text: None}
  ```

  - : The command return value.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.ExecuteCommand(L"oParagraph.AddText(\"Hello from Python!\");");
```

### .docbuilder

```ts
oParagraph.AddText("Hello, world!")
```
