`def CreateScope(self);`

Creates a [context scope](../../CDocBuilderContextScope/index.md) which sets the execution context for all operations executed within a local scope.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.CreateScope* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
scope = context.CreateScope()
```
