```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: ToInt}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to an integer.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.ToInt` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
nGlobal = globalObj.ToInt()
```
