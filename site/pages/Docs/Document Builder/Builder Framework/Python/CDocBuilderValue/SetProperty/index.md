```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: SetProperty}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: name}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: )}
```

## Description

Sets a property to the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.SetProperty` method is not used.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The name of the `CDocBuilderValue` object property.

- value

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
  ```

  - : The value of the `CDocBuilderValue` object property.

</parameters>

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

There are two more ways to set a property to the `CDocBuilderValue` object:

1. use the `Set` method that takes the object property name and value as arguments:

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

2. use the `default[]` postfix expression:

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
