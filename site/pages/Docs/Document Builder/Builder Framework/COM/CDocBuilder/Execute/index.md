```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: Execute}
- {type: text, text: (}
- {type: parameter, text: command}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
- {type: text, text: )}
```

## Description

Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md), or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which commands are available for various document types.

> Please note, that for the `.docbuilder` file the `CDocBuilder.Execute` method is not used explicitly. The command itself is used instead. See the example below.

## Parameters

<parameters>

- command

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The command which will be used to create the document file (the escape character must be used when the command contains quotation symbols).

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The command return value.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderValue* oRun = NULL;
oBuilder->Initialize();
oBuilder->Execute(L"oParagraph.AddText(\"Hello, world!\");", &oRun);
oBuilder->Dispose();
```

### .docbuilder

```ts
oParagraph.AddText("Hello, world!")
```
