`boolean isObject();`

Returns true if the **CDocBuilderValue** object is an object.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.isObject* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolObject = global.isObject();
CDocBuilder.dispose();
```
