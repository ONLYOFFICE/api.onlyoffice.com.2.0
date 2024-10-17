`boolean isString();`

Returns true if the **CDocBuilderValue** object is a string.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.isString* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolString = global.isString();
CDocBuilder.dispose();
```
