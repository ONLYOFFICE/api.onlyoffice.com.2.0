```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: Get}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: key}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: )}
```

## Description

Returns an array value by its index.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Get` method is not used.

## Parameters

<parameters>

- key

  ```yml signature.variant="inline"
  - {type: type, text: int}
  ```

  - : The index of the array value.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
charts = document.Call("GetAllCharts")
chart = charts.Get(1);
```

The `default[]` postfix expression can be also used to get an array value by its index:

``` py
property CDocBuilderValue default[int]
```

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
charts = document.Call("GetAllCharts")
chart = charts[1];
```
