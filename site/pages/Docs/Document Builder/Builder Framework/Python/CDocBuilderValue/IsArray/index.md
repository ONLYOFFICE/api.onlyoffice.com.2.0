```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsArray}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is an array.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsArray` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bArray = globalObj.IsArray()
```
