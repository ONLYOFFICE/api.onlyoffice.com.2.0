```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsDouble}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is a double value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsDouble` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bDouble = globalObj.IsDouble()
```
