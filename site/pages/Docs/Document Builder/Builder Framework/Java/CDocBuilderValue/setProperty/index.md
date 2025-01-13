```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: setProperty}
- {type: text, text: (}
- {type: parameter, text: name}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: )}
```

## Description

Sets a property to the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.setProperty` method is not used.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The name of the `CDocBuilderValue` object property.

- value

  ```yml signature.variant="inline"
  - {type: type, text: Object}
  ```

  - : The value of the `CDocBuilderValue` object property.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue document = api.call("GetDocument");
document.setProperty("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"});
CDocBuilder.dispose();
```

There are two more ways to set a property to the `CDocBuilderValue` object:

1. use the `set` method that takes the object property name and value as arguments:

   ``` java
   void set(String name, Object value);
   ```

   ## Example

   ### Java

   ``` java
   CDocBuilder.initialize("");
   CDocBuilder builder = new CDocBuilder();
   CDocBuilderContext context = builder.getContext();
   CDocBuilderValue global = context.getGlobal();
   CDocBuilderValue api = global.get("Api");
   CDocBuilderValue document = api.call("GetDocument");
   document.set("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"});
   CDocBuilder.dispose();
   ```

2. use the `default[]` postfix expression:

   ``` java
   property CDocBuilderValue default[String]
   ```

   ## Example

   ### Java

   ``` java
   CDocBuilder.initialize("");
   CDocBuilder builder = new CDocBuilder();
   CDocBuilderContext context = builder.getContext();
   CDocBuilderValue global = context.getGlobal();
   CDocBuilderValue api = global.get("Api");
   CDocBuilderValue document = api.call("GetDocument");
   document["color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"}];
   CDocBuilder.dispose();
   ```
