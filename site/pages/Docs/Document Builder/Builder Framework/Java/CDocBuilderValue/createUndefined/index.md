`static CDocBuilderValue createUndefined();`

Creates an undefined value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [createUndefined](../../CDocBuilderContext/createUndefined/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.createUndefined* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue undefinedValue = api.createUndefined();
CDocBuilder.dispose();
```
