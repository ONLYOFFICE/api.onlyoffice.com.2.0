`boolean isEmpty();`

Returns true if the **CDocBuilderValue** object is empty.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.isEmpty* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
boolean boolEmpty = global.isEmpty();
CDocBuilder.dispose();
```
