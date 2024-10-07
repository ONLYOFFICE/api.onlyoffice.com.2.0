`CDocBuilderContextScope^ CreateScope();`

Creates a [context scope](../../CDocBuilderContextScope/index.md) which sets the execution context for all operations executed within a local scope.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.CreateScope* method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CContextScope oScope = oContext.CreateScope();
CDocBuilder.Destroy();
```
