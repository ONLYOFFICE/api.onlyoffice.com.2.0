```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: getGlobal}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the global object for the current context.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.getGlobal` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilder.dispose();
```
