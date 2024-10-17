`CDocBuilderValue CreateArray(int length);`

Creates an array value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [createArray](../../CDocBuilderContext/createArray/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.createArray* method is not used.

## Parameters

| Name     | Type | Description       |
| -------- | ---- | ----------------- |
| *length* | int  | The array length. |

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue arrayValue = api.createArray(2);
CDocBuilder.dispose();
```
