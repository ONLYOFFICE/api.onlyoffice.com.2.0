```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: CreateArray}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: length}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: )}
```

## Description

Creates an array value, an analogue of `new Array (length)` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateArray` method is not used.

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
content = context.CreateArray(1)
```
