```yml signature
- {type: type, text: bool}
- {type: text, text: " "}
- {type: entity, text: IsError}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Checks for errors in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.IsError` method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
bool bError = oContext.IsError();
CDocBuilder.Destroy();
```
