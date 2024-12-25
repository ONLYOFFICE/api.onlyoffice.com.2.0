```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: CreateUndefined}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Creates an undefined value, an analogue of `undefined` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateUndefined` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
content = context.CreateUndefined()
```
