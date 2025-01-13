```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: toBool}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to a boolean value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.toBool` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolValue = global.toBool();
CDocBuilder.dispose();
```
