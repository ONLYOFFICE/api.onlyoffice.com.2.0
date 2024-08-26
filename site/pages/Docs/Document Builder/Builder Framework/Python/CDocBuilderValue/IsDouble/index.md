`def IsDouble(self);`

Returns true if the **CDocBuilderValue** object is a double value.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.IsDouble* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bDouble = globalObj.IsDouble()
```
