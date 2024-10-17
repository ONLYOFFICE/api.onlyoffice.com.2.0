`boolean isNull();`

Returns true if the **CDocBuilderValue** object is null.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.isNll* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolNull = global.isNull();
CDocBuilder.dispose();
```
