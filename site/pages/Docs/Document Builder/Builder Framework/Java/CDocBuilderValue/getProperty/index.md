```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: getProperty}
- {type: text, text: (}
- {type: parameter, text: name}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: )}
```

## Description

Returns a property of the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.getProperty` method is not used.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The name of the `CDocBuilderValue` object property.

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
CDocBuilderValue docPr = document.getProperty("color");
CDocBuilder.dispose();
```

There are two more ways to get a property of the `CDocBuilderValue` object:

1. use the `get` method that takes an argument in the string format:

   ``` java
   CDocBuilderValue get(String name);
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
   CDocBuilderValue docPr = document.get("color");
   CDocBuilder.dispose();
   ```

2. use the `default[]` postfix expression that takes an argument in the string format:

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
   CDocBuilderValue docPr = document["color"];
   CDocBuilder.dispose();
   ```
