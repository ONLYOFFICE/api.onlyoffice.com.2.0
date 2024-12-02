```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: createObject}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Creates an empty object, an analogue of `{}` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.createObject` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue objectValue = context.createObject();
CDocBuilder.dispose();
```
