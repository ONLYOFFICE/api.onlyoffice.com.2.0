```yml signature
- {id: ../../CDocBuilderContextScope/index.md, token: {type: type, text: CDocBuilderContextScope}}
- {type: text, text: " "}
- {type: entity, text: createScope}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Creates a [context scope](../../CDocBuilderContextScope/index.md) which sets the execution context for all operations executed within a local scope.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.createScope` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderContextScope scope = context.createScope();
CDocBuilder.dispose();
```
