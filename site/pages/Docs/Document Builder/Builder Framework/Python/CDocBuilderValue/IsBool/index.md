```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsBool}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is a boolean value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsBool` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bBool = globalObj.IsBool()
```
