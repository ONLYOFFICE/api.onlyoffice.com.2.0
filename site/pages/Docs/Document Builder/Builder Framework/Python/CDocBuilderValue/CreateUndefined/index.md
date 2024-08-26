`def CreateUndefined();`

Creates an undefined value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [CreateUndefined](../../CDocBuilderContext/CreateUndefined/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.CreateUndefined* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
undefined = api.CreateUndefined()
```
