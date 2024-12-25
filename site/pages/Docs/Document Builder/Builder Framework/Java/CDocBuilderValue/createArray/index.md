```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: createArray}
- {type: text, text: (}
- {type: parameter, text: length}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: )}
```

## Description

Creates an array value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [createArray](../../CDocBuilderContext/createArray/index.md) method.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.createArray` method is not used.

## Parameters

<parameters>

- length

  ```yml signature.variant="inline"
  - {type: type, text: int}
  ```

  - : The array length.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue arrayValue = api.createArray(2);
CDocBuilder.dispose();
```
