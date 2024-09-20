`static CDocBuilderValue^ CreateUndefined();`

Creates an undefined value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [CreateUndefined](../../CDocBuilderContext/CreateUndefined/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.CreateUndefined* method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oUndefined = oApi.CreateUndefined();
CDocBuilder.Destroy();
```
