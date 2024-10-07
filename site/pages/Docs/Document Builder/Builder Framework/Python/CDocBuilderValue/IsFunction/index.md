`def IsFunction(self);`

Returns true if the **CDocBuilderValue** object is a function.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.IsFunction* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
bFunction = globalObj.IsFunction()
```
