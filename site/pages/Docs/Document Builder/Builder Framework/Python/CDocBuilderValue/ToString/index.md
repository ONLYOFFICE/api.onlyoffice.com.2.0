`def ToString(self);`

Converts the **CDocBuilderValue** object to a string.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.ToString* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
sGlobal = globalObj.ToString()
```
