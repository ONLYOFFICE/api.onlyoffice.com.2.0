```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: Set}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: key}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: )}
```

## Description

Sets an array value by its index.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Set` method is not used.

## Parameters

<parameters>

- key

  ```yml signature.variant="inline"
  - {type: type, text: int}
  ```

  - : The index of the array value.

- value

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
  ```

  - : The array value to be set.

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
chart =  api.Call("CreateChart", "bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24)
charts.Set(1, oChart)
```

The `default[]` postfix expression can be also used to set an array value by its index:

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
chart =  api.Call("CreateChart", "bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24)
charts[1, oChart]
```
