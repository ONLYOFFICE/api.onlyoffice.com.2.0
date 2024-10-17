`int toInt();`

Converts the **CDocBuilderValue** object to an integer.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.toInt* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
int intValue = global.toInt();
CDocBuilder.dispose();
```
