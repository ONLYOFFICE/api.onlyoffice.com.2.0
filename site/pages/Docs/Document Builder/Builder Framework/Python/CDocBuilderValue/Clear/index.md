```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: Clear}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Clears the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Clear` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
document.Clear()
```
