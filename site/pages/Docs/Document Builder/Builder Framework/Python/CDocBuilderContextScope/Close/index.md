`def Close(self);`

Closes the current scope. This method will be called automatically when the descructor is executed.

> Please note, that for the *.docbuilder* file the *CDocBuilderContextScope.Close* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
scope = context.CreateScope()
scope.Close()
```
