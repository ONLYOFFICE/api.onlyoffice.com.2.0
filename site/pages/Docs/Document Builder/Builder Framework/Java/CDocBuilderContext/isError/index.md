```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: isError}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Checks for errors in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.isError` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
boolean errorValue = context.isError();
CDocBuilder.dispose();
```
