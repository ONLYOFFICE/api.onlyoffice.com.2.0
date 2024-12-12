```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: GetContext}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the `.docbuilder` file the `CDocBuilder.GetContext` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
```
