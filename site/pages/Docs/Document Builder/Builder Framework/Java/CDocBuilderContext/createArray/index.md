`CDocBuilderValue createArray(int length);`

Creates an array value, an analogue of *new Array (length)* in JS.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.createArray* method is not used.

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
CDocBuilderValue arrayValue = context.createArray(2);
CDocBuilder.dispose();
```
