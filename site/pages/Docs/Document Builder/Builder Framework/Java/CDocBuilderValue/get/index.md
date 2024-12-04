```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: get}
- {type: text, text: (}
- {type: parameter, text: index}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: " | "}
- {type: type, text: String}
- {type: text, text: )}
```

## Description

Returns an array value by its index or name.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.get` method is not used.

## Parameters

<parameters>

- index

  ```yml signature.variant="inline"
  - {type: type, text: int}
  - {type: text, text: " | "}
  - {type: type, text: String}
  ```

  - : The index or name of the array value.

</parameters>

## Example

### Jave

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue document = api.call("GetDocument");
CDocBuilderValue charts = document.call("GetAllCharts");
CDocBuilderValue chart = charts.get(1);
CDocBuilder.dispose();
```

The `default[]` postfix expression can be also used to get an array value by its index:

``` java
property CDocBuilderValue default[int]
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
CDocBuilderValue charts = document.call("GetAllCharts");
CDocBuilderValue chart = charts[1];
CDocBuilder.dispose();
```
