```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: createNull}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Creates a null value, an analogue of `null` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.createNull` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue nullValue = context.createNull();
CDocBuilder.dispose();
```
