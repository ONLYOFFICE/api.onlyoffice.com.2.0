```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsUndefined}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is undefined.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsUndefined` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bUndefined = globalObj.IsUndefined()
```
