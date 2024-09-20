`def IsObject(self);`

Returns true if the **CDocBuilderValue** object is an object.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.IsObject* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bObject = globalObj.IsObject()
```
