`def SetProperty(self, name, value);`

Sets a property to the **CDocBuilderValue** object.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.SetProperty* method is not used.

## Parameters

| Name    | Type             | Description                                            |
| ------- | ---------------- | ------------------------------------------------------ |
| *name*  | str              | The name of the **CDocBuilderValue** object property.  |
| *value* | CDocBuilderValue | The value of the **CDocBuilderValue** object property. |

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
document.SetProperty("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"})
```

There are two more ways to set a property to the **CDocBuilderValue** object:

1. use the **Set** method that takes the object property name and value as arguments:

   ``` py
   def Set(self, name, value);
   ```

   ### Example

   ### Python

   ``` py
   builder = docbuilder.CDocBuilder()
   context = builder.GetContext()
   globalObj = context.GetGlobal()
   api = globalObj["Api"]
   document = api.Call("GetDocument")
   document.Set("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"})
   ```

2. use the **default[]** postfix expression:

   ``` py
   property CDocBuilderValue default[str]
   ```

   ### Example

   ### Python

   ``` py
   builder = docbuilder.CDocBuilder()
   context = builder.GetContext()
   globalObj = context.GetGlobal()
   api = globalObj["Api"]
   document = api.Call("GetDocument")
   document["color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"}]
   ```
