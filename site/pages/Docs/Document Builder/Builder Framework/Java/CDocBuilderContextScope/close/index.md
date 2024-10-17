`void close();`

Closes the current scope. This method will be called automatically when the descructor is executed.

> Please note, that for the *.docbuilder* file the *CDocBuilderContextScope.close* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderContextScope scope = context.createScope();
scope.close();
CDocBuilder.dispose();
```
