```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: CreateObject}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Creates an empty object, an analogue of `{}` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateObject` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
content = context.CreateObject()
```
