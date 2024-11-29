```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: createNull}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Creates a null value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [createNull](../../CDocBuilderContext/createNull/index.md) method.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.createNull` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue nullValue = api.createNull();
CDocBuilder.dispose();
```
