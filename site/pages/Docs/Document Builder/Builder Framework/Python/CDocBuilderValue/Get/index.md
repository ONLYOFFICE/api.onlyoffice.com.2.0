`def Get(self, key);`

Returns an array value by its index.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.Get* method is not used.

## Parameters

| Name  | Type | Description                   |
| ----- | ---- | ----------------------------- |
| *key* | int  | The index of the array value. |

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

The **default\[]** postfix expression can be also used to get an array value by its index:

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
