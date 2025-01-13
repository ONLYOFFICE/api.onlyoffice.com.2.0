```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: GetLength}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns the length if the `CDocBuilderValue` object is an array. Otherwise, returns 0.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.GetLength` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument");
charts = document.Call("GetAllCharts")
length = charts.GetLength();
```
