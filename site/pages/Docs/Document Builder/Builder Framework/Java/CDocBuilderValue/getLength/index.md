```yml signature
- {type: type, text: int}
- {type: text, text: " "}
- {type: entity, text: getLength}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the length if the `CDocBuilderValue` object is an array. Otherwise, returns 0.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.getLength` method is not used.

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
int length = charts.getLength();
CDocBuilder.dispose();
```
