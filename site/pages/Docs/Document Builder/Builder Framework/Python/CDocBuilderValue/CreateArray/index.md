```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: CreateArray}
- {type: text, text: (}
- {type: parameter, text: length}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: )}
```

## Description

Creates an array value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [CreateArray](../../CDocBuilderContext/CreateArray/index.md) method.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.CreateArray` method is not used.

## Parameters

<parameters>

- length

  ```yml signature.variant="inline"
  - {type: type, text: int}
  ```

  - : The array length.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
array = api.CreateArray()
```
