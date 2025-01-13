```yml signature
- {id: ../../CDocBuilderContext/index.md, token: {type: type, text: CDocBuilderContext^}}
- {type: text, text: " "}
- {type: entity, text: GetContext}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the `.docbuilder` file the `CDocBuilder.GetContext` method is not used.

## Example

### .Net

``` cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CDocBuilder.Destroy();
```
