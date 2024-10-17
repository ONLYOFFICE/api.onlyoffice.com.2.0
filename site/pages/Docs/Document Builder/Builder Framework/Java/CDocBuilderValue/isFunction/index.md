`boolean isFunction();`

Returns true if the **CDocBuilderValue** object is a function.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.isFunction* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolFunction = global.isFunction();
CDocBuilder.dispose();
```
