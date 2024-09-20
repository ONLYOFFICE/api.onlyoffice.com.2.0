`def GetGlobal(self);`

Returns the global object for the current context.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.GetGlobal* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
```
