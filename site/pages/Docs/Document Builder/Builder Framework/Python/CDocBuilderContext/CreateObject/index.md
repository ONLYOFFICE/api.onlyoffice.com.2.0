`def CreateObject(self);`

Creates an empty object, an analogue of *{}* in JS.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.CreateObject* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
content = context.CreateObject()
```
