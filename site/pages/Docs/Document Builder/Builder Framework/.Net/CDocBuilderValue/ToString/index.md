```yml signature
- {type: type, text: String^}
- {type: text, text: " "}
- {type: entity, text: ToString}
- {type: text, text: (}
- {type: text, text: )}
- {type: keyword, text: " override"}
```

## Description

Converts the `CDocBuilderValue` object to a string.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.ToString` method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
string sGlobal = oGlobal.ToString();
CDocBuilder.Destroy();
```
