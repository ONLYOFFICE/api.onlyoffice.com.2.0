```yml signature
- {type: type, text: String}
- {type: text, text: " "}
- {type: entity, text: toString}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to a string.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.toString` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
String stringValue = global.toString();
CDocBuilder.dispose();
```
