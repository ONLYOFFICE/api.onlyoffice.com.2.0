```yml signature
- {type: keyword, text: static}
- {type: text, text: " "}
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: Destroy}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Unloads the ONLYOFFICE Document Builder from the application memory when it is no longer needed. Generally, there is no need to dispose JS before exiting the process, it should happen automatically. It should only be used if the process needs the resources taken up by JS.

> Please note, that for the `.docbuilder` file the `CDocBuilder.Destroy` method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CDocBuilder.Destroy();
```
