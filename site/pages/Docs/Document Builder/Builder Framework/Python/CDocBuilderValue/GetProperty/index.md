```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: GetProperty}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: name}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: )}
```

## Description

Returns a property of the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.GetProperty` method is not used.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The name of the `CDocBuilderValue` object property.

</parameters>

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

There are two more ways to get a property of the `CDocBuilderValue` object:

1. use the `Get` method that takes an argument in the string format:

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

2. use the `default[]` postfix expression that takes an argument in the string format:

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
