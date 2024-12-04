```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: isBool}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is a boolean value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.isBool` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolBool = global.isBool();
CDocBuilder.dispose();
```
