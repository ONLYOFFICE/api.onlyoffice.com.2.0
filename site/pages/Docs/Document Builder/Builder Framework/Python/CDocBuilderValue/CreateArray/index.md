`def CreateArray(length);`

Creates an array value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [CreateArray](../../CDocBuilderContext/CreateArray/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.CreateArray* method is not used.

## Parameters

| Name     | Type | Description       |
| -------- | ---- | ----------------- |
| *length* | int  | The array length. |

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
array = api.CreateArray()
```
