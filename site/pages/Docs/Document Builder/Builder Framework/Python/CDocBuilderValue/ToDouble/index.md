```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: ToDouble}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to a double value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.ToDouble` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
dGlobal = globalObj.ToDouble()
```
