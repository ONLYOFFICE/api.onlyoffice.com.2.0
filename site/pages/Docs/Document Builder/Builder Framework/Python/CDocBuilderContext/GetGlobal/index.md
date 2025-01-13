```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: GetGlobal}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns the global object for the current context.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.GetGlobal` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
```
