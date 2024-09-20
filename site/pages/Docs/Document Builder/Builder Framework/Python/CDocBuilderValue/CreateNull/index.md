`def CreateNull();`

Creates a null value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [CreateNull](../../CDocBuilderContext/CreateNull/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.CreateNull* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
null = api.CreateNull()
```
