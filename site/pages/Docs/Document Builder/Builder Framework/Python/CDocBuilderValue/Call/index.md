```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: Call}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: name}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: ", "}
- {type: text, text: "*"}
- {type: parameter, text: args}
- {type: text, text: ": "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: )}
```

## Description

Calls the specified Document Builder method. See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md) or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which methods are available for various document types.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Call` method is not used explicitly. The method itself is used instead. See the example below.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The name of the Document Builder method.

- args

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
  ```

  - : The parameters that the Document Builder method takes as arguments.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
```

### .docbuilder

```ts
const oDocument = Api.GetDocument()
```
