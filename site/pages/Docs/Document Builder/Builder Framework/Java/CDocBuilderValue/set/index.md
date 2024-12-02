```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: set}
- {type: text, text: (}
- {type: parameter, text: index}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: " | "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {type: type, text: Object}
- {type: text, text: )}
```

## Description

Sets an array value by its index or name.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.set` method is not used.

## Parameters

<parameters>

- index

  ```yml signature.variant="inline"
  - {type: type, text: int}
  - {type: text, text: " | "}
  - {type: type, text: String}
  ```

  - : The index or name of the array value.

- value

  ```yml signature.variant="inline"
  - {type: type, text: Object}
  ```

  - : The array value to be set.

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
CDocBuilderValue charts = api.call("GetAllCharts");
CDocBuilderValue chart =  api.call("CreateChart", "bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
charts.set(1, chart);
CDocBuilder.dispose();
```

The `default[]` postfix expression can be also used to set an array value by its index:

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
CDocBuilderValue charts = api.call("GetAllCharts");
CDocBuilderValue chart =  api.call("CreateChart", "bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
charts[1, chart];
CDocBuilder.dispose();
```
