`def GetProperty(self, name);`

Returns a property of the **CDocBuilderValue** object.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.GetProperty* method is not used.

## Parameters

| Name   | Type | Description                                           |
| ------ | ---- | ----------------------------------------------------- |
| *name* | str  | The name of the **CDocBuilderValue** object property. |

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
docPr = document.GetProperty("color")
```

There are two more ways to get a property of the **CDocBuilderValue** object:

1. use the **Get** method that takes an argument in the string format:

   ``` py
   def Get(self, name);
   ```

   ## Example

   ### Python

   ``` py
   builder = docbuilder.CDocBuilder()
   context = builder.GetContext()
   globalObj = context.GetGlobal()
   api = globalObj["Api"]
   document = api.Call("GetDocument")
   docPr = document.Get("color")
   ```

2. use the **default\[]** postfix expression that takes an argument in the string format:

   ``` py
   property CDocBuilderValue default[str]
   ```

   ## Example

   ### Python

   ``` py
   builder = docbuilder.CDocBuilder()
   context = builder.GetContext()
   globalObj = context.GetGlobal()
   api = globalObj["Api"]
   document = api.Call("GetDocument")
   docPr = document["color"]
   ```
