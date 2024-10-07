`def IsUndefined(self);`

Returns true if the **CDocBuilderValue** object is undefined.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.IsUndefined* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bUndefined = globalObj.IsUndefined()
```
