`void clear();`

Clears the **CDocBuilderValue** object.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.clear* method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilderValue global = context.getGlobal();
CDocBuilderValue api = global.get("Api");
CDocBuilderValue document = api.call("GetDocument");
document.clear();
CDocBuilder.dispose();
```
