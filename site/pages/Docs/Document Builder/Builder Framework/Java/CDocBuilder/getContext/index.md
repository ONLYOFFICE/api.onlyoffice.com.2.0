`CDocBuilderContext getContext(boolean enterContext = 0);`

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the *.docbuilder* file the *CDocBuilder.getContext* method is not used.

## Parameters

| Name           | Type    | Description                                    |
| -------------- | ------- | ---------------------------------------------- |
| *enterContext* | boolean | Specifies whether the context will be entered. |

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilder.dispose();
```
