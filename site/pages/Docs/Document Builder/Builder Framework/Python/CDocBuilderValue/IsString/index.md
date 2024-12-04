```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsString}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is a string.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsString` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bString = globalObj.IsString()
```
