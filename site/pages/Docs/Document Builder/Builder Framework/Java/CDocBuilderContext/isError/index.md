`boolean isError();`

Checks for errors in JS.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.isError* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
boolean errorValue = context.isError();
CDocBuilder.dispose();
```
