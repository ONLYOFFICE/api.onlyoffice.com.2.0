```yml signature
- {type: type, text: String^}
- {type: text, text: " "}
- {type: entity, text: GetVersion}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the ONLYOFFICE Document Builder engine version.

> Please note, that for the `.docbuilder` file the `CDocBuilder.GetVersion` method is not used.

## Example

### .Net

``` cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
string sVersion = oBuilder.GetVersion();
CDocBuilder.Destroy();
```
