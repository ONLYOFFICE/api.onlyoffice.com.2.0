```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: Close}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Closes the current scope. This method will be called automatically when the descructor is executed.

> Please note, that for the `.docbuilder` file the `CDocBuilderContextScope.Close` method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CContextScope oScope = oContext.CreateScope();
oScope.Close();
CDocBuilder.Destroy();
```
