```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: call}
- {type: text, text: (}
- {type: parameter, text: name}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: p1}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: ", "}
- {type: parameter, text: p2}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: ", "}
- {type: parameter, text: p3}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: ", "}
- {type: parameter, text: p4}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: ", "}
- {type: parameter, text: p5}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: ", "}
- {type: parameter, text: p6}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: )}
```

## Description

Calls the specified Document Builder method. See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md) or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which methods are available for various document types.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.call` method is not used explicitly. The method itself is used instead. See the example below.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The name of the Document Builder method.

- p1-p6

  ```yml signature.variant="inline"
  - {type: type, text: Object}
  ```

  - : The parameters that the Document Builder method takes as argumens.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue document = api.call("GetDocument");
CDocBuilder.dispose();
```

### .docbuilder

```ts
const oDocument = Api.GetDocument()
```
