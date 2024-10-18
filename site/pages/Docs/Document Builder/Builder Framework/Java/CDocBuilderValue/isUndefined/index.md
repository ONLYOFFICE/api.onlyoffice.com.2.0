`boolean isUndefined();`

Returns true if the **CDocBuilderValue** object is undefined.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.isUndefined* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolUndefined = global.isUndefined();
CDocBuilder.dispose();
```
