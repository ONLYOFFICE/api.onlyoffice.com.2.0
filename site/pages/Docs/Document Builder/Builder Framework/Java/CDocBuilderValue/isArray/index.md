```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: isArray}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is an array.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.isArray` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolArray = global.isArray();
CDocBuilder.dispose();
```
